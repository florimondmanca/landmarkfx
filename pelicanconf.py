AUTHOR = "Florimond Manca"
SITENAME = "Landmark FX"
SITEURL = ""

PATH = "content"

TIMEZONE = "Europe/Paris"

DEFAULT_LANG = "fr"
LOCALE = ("fr", "en", "fr_FR", "en_US", "fr_FR.utf8", "en_US.utf-8")
DATE_FORMATS = {
    "fr": "%d %b %Y",
    "en": "%Y-%m-%d",
}

# Plugins
PLUGIN_PATHS = ["pelican_plugins"]
PLUGINS = ["i18n_subsites"]

# Jinja2
JINJA_ENVIRONMENT = {
    "extensions": ["jinja2.ext.i18n"],
}

# I18N
I18N_SUBSITES = {
    "en": {
        "SITENAME": "Landmark FX",
    }
}
I18N_TEMPLATES_LANG = "es"  # Other to force FR translations

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = []

# Social widget
SOCIAL = []

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

STATIC_PATHS = ["static"]

THEME = "./theme"
STYLESHEET_URL = "/static/simple.min.css"
