# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString

# config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
# Set a fake user agent string
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.reddit.com')

# Allow websites to register protocol handlers via
# `navigator.registerProtocolHandler`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Minimum width (in pixels) of tabs (-1 for the default minimum size
# behavior). This setting only applies when tabs are horizontal. This
# setting does not apply to pinned tabs, unless `tabs.pinned.shrink` is
# False.
# Type: Int
c.tabs.min_width = 100

# Maximum width (in pixels) of tabs (-1 for no maximum). This setting
# only applies when tabs are horizontal. This setting does not apply to
# pinned tabs, unless `tabs.pinned.shrink` is False. This setting may
# not apply properly if max_width is smaller than the minimum size of
# tab contents, or smaller than tabs.min_width.
# Type: Int
c.tabs.max_width = 150

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`). * `{0}` means the same as `{}`, but can be used
# multiple times.  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://search.brave.com/search?q={}',
                       'ddg': 'https://duckduckgo.com/?q={}',
                       'aw': 'https://wiki.archlinux.org/?search={}',
                       'g': 'https://www.google.com/search?hl=en&q={}',
                       'gh': 'https://github.com/search?q={}',
                       'yt': 'https://www.youtube.com/results?search_query={}',
                       'man': ' https://www.die.net/search/?q={}',
                       'aur': 'https://aur.archlinux.org/packages?O=0&SeB=nd&K={}',
                       'r/': 'https://www.reddit.com/r/{}',
                       'u/': 'https://www.reddit.com/u/{}',
                       }

# The start page
c.url.start_pages = ["qute://start/"]
c.url.default_page = "qute://start/"

# Enable pdf.js
c.content.pdfjs = False

# Setting color scheme
# Type: QssColor
primary_color_1    = "#7aa2f7"
primary_color_2    = "#9ece6a"
secondary_color_1  = "#e0af68"
secondary_color_2  = "#bb9af7"
background_color   = "#24283b"
warning_color      = "#f7768e"
text_color         = "#c0caf5"
text_color_2  = "#24283b"

c.colors.completion.odd.bg = background_color
c.colors.completion.even.bg = background_color
c.colors.completion.item.selected.fg = background_color
c.colors.completion.item.selected.bg = primary_color_1
c.colors.completion.category.fg = text_color_2
c.colors.completion.category.bg = primary_color_2
c.colors.completion.scrollbar.fg = primary_color_2
c.colors.completion.scrollbar.bg = background_color

c.colors.tabs.bar.bg = background_color
c.colors.tabs.odd.bg = background_color
c.colors.tabs.even.bg = background_color
c.colors.tabs.odd.fg = text_color
c.colors.tabs.even.fg = text_color
c.colors.tabs.selected.odd.fg = background_color
c.colors.tabs.selected.even.fg = background_color
c.colors.tabs.selected.odd.bg = primary_color_1
c.colors.tabs.selected.even.bg = primary_color_1
c.colors.tabs.indicator.error = warning_color
c.colors.tabs.indicator.start = primary_color_2
c.colors.tabs.indicator.stop = primary_color_1
c.tabs.padding = {"bottom": 4, "left": 5, "right": 5, "top":4}

c.colors.statusbar.normal.fg = text_color
c.colors.statusbar.normal.bg = background_color
c.colors.statusbar.insert.fg = background_color
c.colors.statusbar.insert.bg = primary_color_1
c.colors.statusbar.passthrough.fg = text_color_2
c.colors.statusbar.passthrough.bg = primary_color_2
c.colors.statusbar.caret.fg = text_color
c.colors.statusbar.caret.bg = secondary_color_2

c.colors.downloads.bar.bg = background_color
c.colors.downloads.start.fg = background_color
c.colors.downloads.start.bg = primary_color_2
c.colors.downloads.stop.fg = background_color
c.colors.downloads.stop.bg = primary_color_1
c.colors.downloads.error.fg = background_color
c.colors.downloads.error.bg = warning_color

c.colors.contextmenu.menu.bg = background_color
c.colors.contextmenu.menu.fg = text_color
c.colors.contextmenu.selected.fg = background_color
c.colors.contextmenu.selected.bg = primary_color_1

c.colors.messages.error.fg = text_color
c.colors.messages.error.bg = warning_color
c.colors.messages.info.fg = text_color
c.colors.messages.info.bg = primary_color_2
c.colors.messages.warning.fg = text_color
c.colors.messages.warning.bg = secondary_color_1

c.colors.prompts.fg = text_color
c.colors.prompts.bg = background_color
c.colors.prompts.selected.fg = background_color
c.colors.prompts.selected.bg = primary_color_1
c.colors.prompts.border = "1px solid" + primary_color_2

c.colors.hints.bg = primary_color_1
c.colors.hints.fg = background_color
c.hints.border = "solid 0px"
c.hints.radius = 1

c.colors.webpage.bg = background_color
c.colors.webpage.preferred_color_scheme = "dark"

c.colors.webpage.darkmode.enabled = True

c.completion.scrollbar.padding = 1
c.completion.scrollbar.width = 7
c.tabs.show = 'multiple'
c.content.javascript.can_open_tabs_automatically = True

# c.editor.command = ["alacritty", "--class", "Alacritty:Floating", "-o", "font.size=9.0", "-e", "nvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]
c.editor.command = ["nve", "{file}"]
c.downloads.location.directory = "~/downloads/unorganized/"

# Bindings for normal mode
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind(',e', 'edit-text')
config.bind(',r', 'spawn dmenuread web {url}')
config.bind(',R', 'hint links spawn dmenuread web {url}')
config.bind(',m', 'hint links spawn linkhandler_mpd {hint-url}')
config.bind(',M', 'spawn linkhandler_mpd {url}')
#  config.bind(',v', 'hint links spawn --detach mpv {hint-url}')
#  config.bind(',V', 'spawn --detach mpv {url}')
#  Added temporarily till no audio bug is fixed
config.bind(',v', 'hint links spawn --detach mpv --ytdl-format="bestaudio+bestvideo[height<=720]" --force-window=immediate --ytdl=no --script-opts=ytdl_hooks-all_formats="yes" {hint-url}')
config.bind(',V', 'spawn --detach mpv --ytdl-format="bestaudio+bestvideo[height<=720]" --force-window=immediate --ytdl=no --script-opts=ytdl_hooks-all_formats="yes" {url}')

config.bind('<Ctrl+o>', 'cmd-set-text -s :open -w')
config.bind('<Ctrl+Shift+o>', 'open -p')
