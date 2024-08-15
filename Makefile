.PHONY: build help clean regenerate serve start dist upload

include $(wildcard .env.local)

PY?=
PELICAN?=venv/bin/pelican
PELICANOPTS=

BABEL?=venv/bin/pybabel
BABELCONFIG?=babel.cfg
BABELMESSAGES?=theme/translations/messages.pot
TRANSLATIONSDIR?=theme/translations/

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

FTP_HOST=landmarkfx.fr
FTP_USER?=
FTP_PASSWORD?=
FTP_TARGET_DIR=/

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

SERVER ?= "0.0.0.0"

PORT ?= 0
ifneq ($(PORT), 0)
	PELICANOPTS += -p $(PORT)
endif

help:
	@echo 'Makefile for a pelican Web site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make html                           (re)generate the web site          '
	@echo '   make clean                          remove the generated files         '
	@echo '   make regenerate                     regenerate files upon modification '
	@echo '   make publish                        generate using production settings '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000'
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80    '
	@echo '   make devserver [PORT=8000]          serve and regenerate together      '
	@echo '   make devserver-global               regenerate and serve on 0.0.0.0    '
	@echo '   make ftp_upload                     upload the web site via FTP        '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

venv:
	python3 -m venv venv

install-python: venv
	venv/bin/pip install -U wheel setuptools
	venv/bin/pip install -r requirements.txt

install: install-python

extractmessages:
	"$(BABEL)" extract --mapping "$(BABELCONFIG)" --output "$(BABELMESSAGES)" ./theme

initmessages:
	"$(BABEL)" init --input-file "$(BABELMESSAGES)" --output-dir "$(TRANSLATIONSDIR)" --locale fr --domain messages
	"$(BABEL)" init --input-file "$(BABELMESSAGES)" --output-dir "$(TRANSLATIONSDIR)" --locale en_US --domain messages

compilemessages:
	"$(BABEL)" compile --directory "$(TRANSLATIONSDIR)" --domain messages

updatemessages:
	"$(BABEL)" update --input-file "$(BABELMESSAGES)" --output-dir "$(TRANSLATIONSDIR)" --domain messages

messages: extractmessages updatemessages compilemessages

build: compilemessages
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

regenerate:
	make build PELICANOPTS="$(PELICANOPTS) -r"

clean:
	[ ! -d "$(OUTPUTDIR)" ] || rm -rf "$(OUTPUTDIR)"

start:
	"$(PELICAN)" --listen --autoreload "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

publish:
	make build CONFFILE="$(PUBLISHCONF)"

ftp_upload: publish
	LFTP_PASSWORD=$(FTP_PASSWORD) lftp ftp://$(FTP_USER)@$(FTP_HOST) -e "mirror -R $(OUTPUTDIR) $(FTP_TARGET_DIR) ; quit" --env-password

local:
	open http://localhost:8000

prod:
	open https://landmarkfx.fr
