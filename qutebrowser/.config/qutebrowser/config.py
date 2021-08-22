import os

HOME = os.path.expanduser("~")

config.load_autoconfig(False)
c.input.insert_mode.auto_enter = False
c.input.insert_mode.auto_leave = False
c.fonts.default_family = "Terminus"
c.fonts.default_size = "12pt"
c.backend = "webengine"
c.auto_save.session = False
c.content.geolocation = False
c.content.desktop_capture = True
c.content.media.audio_capture = True
c.content.media.video_capture = True
c.content.media.audio_video_capture = True
c.content.notifications.enabled = False
c.content.tls.certificate_errors = "block"
c.completion.cmd_history_max_items = 0
c.completion.web_history.max_items = 0
c.downloads.location.directory = HOME
c.downloads.location.remember = False
c.url.default_page = "https://www.google.com.tw/"
c.url.start_pages = "https://www.google.com.tw/"
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "scholar": "https://scholar.google.com/scholar?hl=zh-TW&as_sdt=0%2C5&q={}",
    "youtube": "https://www.youtube.com/results?search_query={}",
    "wiki": "https://en.wikipedia.org/wiki/{}",
    "archwiki": "https://wiki.archlinux.org/title/{}",
    "aur": "https://aur.archlinux.org/packages/?O=0&K={}",
    "pacman": "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "wolframalpha": "https://www.wolframalpha.com/input/?i={}",
    "github": "https://github.com/search?q={}",
}

config.bind(",,", "open -t https://www.google.com.tw/")
config.bind(",a", "open -t https://music.apple.com/tw/browse")
config.bind(",b", "open -t https://viewer-ebook.books.com.tw/viewer")
config.bind(",g", "open -t https://github.com/10873028")
config.bind(",n", "open -t https://www.netflix.com/browse")
config.bind(",y", "open -t https://www.youtube.com/")
config.bind(",q", "open -t https://docs.qtile.org/en/latest/")
config.bind(",k", "open -t https://read.amazon.com/kindle-library")
config.bind(",r", "open -t https://www.reddit.com")
config.bind(",p", "open -t http://term.ptt.cc")
config.bind(",l", "open -t https://leetcode.com")
config.bind("i", "mode-enter passthrough")
for c in ";wqmgtsxvb.":
    config.bind(c, "nop")
