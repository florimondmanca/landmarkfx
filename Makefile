.PHONY: build help clean regenerate serve start dist upload

PY?=
PELICAN?=venv/bin/pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
DISTDIR=$(BASEDIR)/dist
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

SSH_TARGET_DIR=/var/www/landmarkfx

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
	@echo '   make ssh_upload                     upload the web site via SSH        '
	@echo '   make sftp_upload                    upload the web site via SFTP       '
	@echo '   make rsync_upload                   upload the web site via rsync+ssh  '
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

build:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

regenerate:
	make build PELICANOPTS="$(PELICANOPTS) -r"

clean:
	[ ! -d "$(OUTPUTDIR)" ] || rm -rf "$(OUTPUTDIR)"

serve:
	"$(PELICAN)" -l "$(INPUTDIR)" -o "$(OUTPUTDIR)" -s "$(CONFFILE)" $(PELICANOPTS)

start:
	make serve PELICANOPTS="-r $(PELICANOPTS)"

dist:
	"$(PELICAN)" "$(INPUTDIR)" -o "$(DISTDIR)" -s "$(PUBLISHCONF)" $(PELICANOPTS)

start-dist:
	make serve OUTPUTDIR=$(DISTDIR)

upload: dist
	rsync -e "ssh" -P -rvzc --include tags --cvs-exclude --delete "$(DISTDIR)"/ "debian@florimond.dev:$(SSH_TARGET_DIR)"
