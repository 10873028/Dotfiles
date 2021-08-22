import os
import subprocess
import psutil
from libqtile import bar, layout, widget, hook
from libqtile.config import (
    Click,
    Drag,
    Group,
    Key,
    Match,
    Screen,
    ScratchPad,
    DropDown,
)
from libqtile.lazy import lazy

strHome = os.path.expanduser("~")
strTerm = "st"
strFont = "Terminus"
strColorList = ["#000000", "#ffffff", "#ff0000", "#00ff00"]
intFontSize = 18


mod = "mod4"
keys = [
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod], "Left", lazy.window.move_floating(-20, 0)),
    Key([mod], "Down", lazy.window.move_floating(0, 20)),
    Key([mod], "Up", lazy.window.move_floating(0, -20)),
    Key([mod], "Right", lazy.window.move_floating(20, 0)),
    Key([mod, "shift"], "Left", lazy.window.resize_floating(-20, 0)),
    Key([mod, "shift"], "Down", lazy.window.resize_floating(0, 20)),
    Key([mod, "shift"], "Up", lazy.window.resize_floating(0, -20)),
    Key([mod, "shift"], "Right", lazy.window.resize_floating(20, 0)),
    Key([mod], "r", lazy.layout.flip()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "equal", lazy.layout.grow()),
    Key([mod], "minus", lazy.layout.shrink()),
    Key([mod], "BackSpace", lazy.layout.reset()),
    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "p", lazy.spawn("dmenu_run")),
    Key([mod], "Return", lazy.spawn(strTerm)),
    Key([mod], "s", lazy.group["scratchpad"].dropdown_toggle(strTerm)),
    Key([mod], "grave", lazy.next_screen()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 10%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 10%-")),
    Key([], "Print", lazy.spawn("scrot")),
]


groups = [
    ScratchPad(
        "scratchpad", [DropDown(strTerm, strTerm, opacity=1, height=0.8, x=0.1, y=0.1)]
    ),
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
]

for index, group in enumerate(groups):
    keys.extend(
        [
            Key([mod], str(index), lazy.group[group.name].toscreen(toggle=False)),
            Key(
                [mod, "shift"],
                str(index),
                lazy.window.togroup(group.name, switch_group=False),
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        border_focus=strColorList[1], border_normal=strColorList[0], ratio=0.55
    ),
    layout.Max(),
]


def SetWidgetList():
    return [
        widget.GroupBox(
            font=strFont,
            fontsize=intFontSize,
            foreground=strColorList[1],
            active=strColorList[1],
            inactive=strColorList[0],
            highlight_method="block",
            urgent_alert_method="block",
            block_highlight_text_color=strColorList[0],
            this_screen_border=strColorList[1],
            this_current_screen_border=strColorList[1],
            rounded=False,
            padding=5,
            margin_x=0,
            margin_y=3,
            disable_drag=True,
            use_mouse_wheel=False,
        ),
        widget.CurrentScreen(
            font=strFont,
            fontsize=intFontSize,
            padding=7,
            active_color=strColorList[3],
            inactive_color=strColorList[2],
        ),
        widget.CurrentLayout(
            font=strFont, fontsize=intFontSize, foreground=strColorList[1], padding=7
        ),
        widget.Spacer(),
    ]


staticWidgetList = [
    widget.Volume(
        font=strFont,
        fontsize=intFontSize,
        foreground=strColorList[1],
        padding=7,
        fmt="Volume:{}",
    ),
    widget.Clock(
        font=strFont,
        fontsize=intFontSize,
        foreground=strColorList[1],
        padding=7,
        format="%Y-%m-%d %a %I:%M %p",
    ),
    widget.QuickExit(
        font=strFont,
        fontsize=intFontSize,
        foreground=strColorList[2],
        padding=7,
    ),
]

screens = [
    Screen(
        bottom=bar.Bar(
            SetWidgetList() + staticWidgetList,
            30,
            background=strColorList[0],
            opacity=1,
        ),
    ),
]

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]


@hook.subscribe.client_new
def _swallow(window):
    pid = window.window.get_net_wm_pid()
    ppid = psutil.Process(pid).ppid()
    cpids = {
        c.window.get_net_wm_pid(): wid for wid, c in window.qtile.windows_map.items()
    }
    for i in range(5):
        if not ppid:
            return
        if ppid in cpids:
            parent = window.qtile.windows_map.get(cpids[ppid])
            parent.minimized = True
            window.parent = parent
            return
        ppid = psutil.Process(ppid).ppid()


@hook.subscribe.client_killed
def _unswallow(window):
    if hasattr(window, "parent"):
        window.parent.minimized = False


@hook.subscribe.startup_once
def autostart():
    subprocess.call([strHome + "/.config/qtile/autostart.sh"])


dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=strColorList[3],
    border_normal=strColorList[0],
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
        Match(wm_class="Sxiv"),
    ],
)
auto_fullscreen = True
focus_on_window_activation = "never"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
