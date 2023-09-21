config.load_autoconfig(False)

# Accept Cookies
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

# Set dark mode
#config.set("colors.webpage.darkmode.enabled", True)

# Set ranger to filepicker
config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['st', '-c', 'ranger,ranger', '-e', 'ranger', '--choosefile', '{}'])
config.set("fileselect.multiple_files.command", ['st', '-c', 'ranger,ranger', '-e', 'ranger', '--choosefiles', '{}'])

# Focus on my startpage
config.set('input.mode_override', 'passthrough', 'andradecore.github.io')

# Set default start page and new page
c.url.default_page = "https://andradecore.github.io"
c.url.start_pages = "https://andradecore.github.io"

# Save sessions by default
config.set("auto_save.session", True)

# Auto play videos
config.set("content.autoplay", False)

# Ad Block
config.set("content.blocking.enabled", True)

# Keybings
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
