import random

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
# config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.images', True, 'chrome-devtools://*')

## Reduce finger printing
config.set('content.headers.accept_language', 'en-US,en;q=0.5')
config.set('content.headers.custom', {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"})
config.set('content.canvas_reading', True)
config.set('content.webgl', True)
config.set('content.blocking.method', 'both')



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

c.tabs.position = 'top'

# Minimum width (in pixels) of tabs (-1 for the default minimum size
# behavior). This setting only applies when tabs are horizontal. This
# setting does not apply to pinned tabs, unless `tabs.pinned.shrink` is
# False.
# Type: Int
c.tabs.min_width = 100

c.tabs.max_width = 150

c.url.searchengines = {'br': 'https://search.brave.com/search?q={}',
                       'ddg': 'https://duckduckgo.com/?q={}',
                       'aw': 'https://wiki.archlinux.org/?search={}',
                       'DEFAULT': 'https://www.google.com/search?hl=en&q={}',
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
background_color   = "#1a1b26"
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

# c.colors.webpage.bg = background_color
c.colors.webpage.preferred_color_scheme = "dark"

c.colors.webpage.darkmode.enabled = False

c.completion.scrollbar.padding = 1
c.completion.scrollbar.width = 7
c.tabs.show = 'multiple'
c.content.javascript.can_open_tabs_automatically = True
c.content.javascript.clipboard = "access"

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
config.bind(',p', 'spawn --user qute-pass')

config.bind('<Ctrl+o>', 'cmd-set-text -s :open -w')
config.bind('<Ctrl+Shift+o>', 'open -p')

c.content.blocking.method = 'both'
c.spellcheck.languages = ["en-US"]
