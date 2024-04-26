# Make config autoload
config.load_autoconfig(False)

# Set dark mode
#c.colors.webpage.darkmode.enabled = True

# Default Zoom
c.zoom.default = '110%'

# Font
c.fonts.default_family = "JetBrains Mono Nerd Font"
c.fonts.default_size = '9pt'
c.fonts.completion.entry = '9pt "JetBrains Mono Nerd Font"'
c.fonts.debug_console = '9pt "JetBrains Mono Nerd Font"'
c.fonts.prompts = '9pt "JetBrains Mono Nerd Font"'
c.fonts.statusbar = '9pt "JetBrains Mono Nerd Font"'

# Disable JavaScript and exceptions
c.content.javascript.enabled = True
config.set('content.javascript.enabled', True, '*://*.andradecore.github.io/*')
config.set('content.javascript.enabled', True, '*://*.youtube.com/*')
config.set('content.javascript.enabled', True, '*://*.twitter.com/*')
config.set('content.javascript.enabled', True, '*://*.instagram.com/*')
config.set('content.javascript.enabled', True, '*://*.play.max.com/*')
config.set('content.javascript.enabled', True, '*://*.music.youtube.com/*')
config.set('content.javascript.enabled', True, '*://*.web.whatsapp.com/*')
config.set('content.javascript.enabled', False, '*://*.google.com/*')


# Set nnn to filepicker
import os
os.environ["NNN_PLUG"] = "p:preview-tui"
os.environ["NNN_FIFO"] = "/tmp/nnn.fifo"
#os.environ["NNN_FCOLORS"] = "AAAAE631BBBBCCCCDDDD9999"
os.environ["NNN_USE_EDITOR"] = "1"
os.environ["NNN_TERMINAL"] = "st"
os.environ["PAGER"] = "less -R"
config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['st', '-c', 'nnn,nnn', '-e', 'nnn', '-p', '{}'])
config.set("fileselect.multiple_files.command", ['st', '-c', 'nnn,nnn', '-e', 'nnn', '-p', '{}'])

# Focus on my startpage
#config.set('input.mode_override', 'passthrough', 'andradecore.github.io')

# Set default start page and new page
c.url.default_page = "https://andradecore.github.io"
c.url.start_pages = "https://andradecore.github.io"

# Save sessions by default
c.auto_save.session = True

# Auto play videos
c.content.autoplay = False

# Ad Block
c.content.blocking.enabled = True

# Keybings
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('px', 'config-cycle content.proxy "socks://localhost:9050" "system"')

# MPV and Youtube DL
config.bind('M', 'hint links spawn mpv {hint-url}')

# Colors
c.colors.completion.fg = '#ABB2BF'
c.colors.completion.odd.bg = '#080808'
c.colors.completion.even.bg = '#080808'
c.colors.completion.category.fg = '#917699'
c.colors.completion.category.bg = '#080808'
c.colors.completion.item.selected.bg = '#345E81'
c.colors.completion.item.selected.fg = '#ffffff'
c.colors.completion.item.selected.border.bottom = '#345E81'
c.colors.completion.item.selected.border.top = '#345E81'
c.colors.hints.fg = '#ffffff'
c.colors.hints.bg = '#345E81'
c.colors.hints.match.fg = '#000000'
c.colors.messages.info.bg = '#080808'
c.colors.statusbar.normal.bg = '#080808'
c.colors.statusbar.insert.fg = '#6a89a2'
c.colors.statusbar.insert.bg = '#080808'
c.colors.statusbar.passthrough.bg = '#56B6C2'
c.colors.statusbar.command.bg = '#080808'
c.colors.statusbar.url.warn.fg = '#3f5261'
c.colors.tabs.bar.bg = '#080808'
c.colors.tabs.odd.bg = '#2b2b3b'
c.colors.tabs.even.bg = '#2b2b3b'
c.colors.tabs.selected.odd.bg = '#080808'
c.colors.tabs.selected.even.bg = '#080808'
c.colors.tabs.pinned.odd.bg = '#080808'
c.colors.tabs.pinned.even.bg = '#080808'
c.colors.tabs.pinned.selected.odd.bg = '#080808'
c.colors.tabs.pinned.selected.even.bg = '#080808'
