#   ___ _____ ___ _     _____    ____             __ _       
#  / _ \_   _|_ _| |   | ____|  / ___|___  _ __  / _(_) __ _ 
# | | | || |  | || |   |  _|   | |   / _ \| '_ \| |_| |/ _` |
# | |_| || |  | || |___| |___  | |__| (_) | | | |  _| | (_| |
#  \__\_\|_| |___|_____|_____|  \____\___/|_| |_|_| |_|\__, |
#                                                      |___/ 
# Icons: https://fontawesome.com/search?o=r&m=free

from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.backend.wayland import InputConfig
from libqtile.dgroups import simple_key_binder
from libqtile import bar, layout, qtile, widget, hook
from libqtile.lazy import lazy
from os.path import expanduser
from subprocess import Popen

# --------------------------------------------------------
# Default apps
# --------------------------------------------------------

terminal = "alacritty"
browser = "zen-browser"

# --------------------------------------------------------
# Keybindings
# --------------------------------------------------------
mod = "mod4"    # left super

keys = [

    # Switch focus between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "c", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Float/max focused windows
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, 
    # like Max layout, but still with multiple stack panes
    Key([mod], "m", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Map buttons for brightness and volumes
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl -q s +5%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl -q s 5%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset Master 5%- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset Master 5%+ unmute")),

    # screenshot
    Key([mod], "s", lazy.spawn('grim -g "$(slurp)" ~/pictures/$(date +"%y%m%d%H%M%S").png && wl-copy < ~/pictures/$(date +"%y%m%d%H%M%S").png', shell=True)),

    # Toggle between different layouts as defined in layouts section
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "space", lazy.spawn("fuzzel -I --dpi-aware=no"), desc="Spawn a command using a prompt widget"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # System controls
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "x", lazy.spawn("wlogout -b 2")),

    # System notifs
    Key([mod], "w", lazy.spawn("makoctl dismiss -a")),
    Key([mod], "e", lazy.spawn("makoctl restore")),

    # Quick app launch
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch Browser"),
    # Key([mod], "n", lazy.spawn(file_manager), desc="Launch File Manager"),
]

# --------------------------------------------------------
# Virtual terminals
# --------------------------------------------------------

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(["control", "mod1"], f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

# --------------------------------------------------------
# Layouts
# --------------------------------------------------------

layouts = [
    #layout.Bsp(margin=5),
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Columns(border_focus="#bb9af7", border_normal="#323232", margin=5),
    #layout.Matrix(),
    layout.Max(margin=5),
    #layout.MonadTall(margin=5),
    #layout.MonadWide(margin=5),
    #layout.Stack(num_stacks=2),
    #layout.RatioTile(),
    #layout.Tile(),
    #layout.TreeTab(),
    #layout.VerticalTile(),
    #layout.Zoomy(),
]

# Drag floating layouts
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button2", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button3", lazy.window.bring_to_front()),
]

# Establish floating rules
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),         # gitk
        Match(wm_class="makebranch"),           # gitk
        Match(wm_class="maketag"),              # gitk
        Match(wm_class="ssh-askpass"),          # ssh-askpass
        Match(title="branchdialog"),            # gitk
        Match(title="pinentry"),                # GPG key password entry
        #Match(title="Picture-in-Picture"),
    ]
)

floats_kept_above = True

# --------------------------------------------------------
# Groups
# --------------------------------------------------------

groups = [Group(i, layout="columns") for i in "1234567890"]
dgroups_key_binder = simple_key_binder(mod)

# --------------------------------------------------------
# Widgets
# --------------------------------------------------------

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=14,
    padding=3,
)

extension_defaults = widget_defaults.copy()

seperator = [
        widget.Spacer(length=4),
        widget.TextBox(text="|", fontsize=18, foreground="#343434"),
        widget.Spacer(length=4),
]

widgets = [
        widget.Spacer(length=5),
        
        # current layout indicator
        widget.CurrentLayoutIcon(scale=0.60),
        seperator,

        # workspaces
        widget.GroupBox(
            borderwidth=2, 
            active="#ffffff", 
            inactive="#a0a0a0", 
            margin_x=2, 
            highlight_method='block',
            block_highlight_text_color="#000000",
            this_current_screen_border="#cba6f7",
        ),
        seperator,

        # current app being focused
        widget.WindowName(
            empty_group_string="Nothing going on rn...",
            foreground="#89b4fa",
            max_chars=34, 
        ),

        # current connect net
        widget.Wlan(
            foreground="#94e2d5",
            format="󰖩 {percent:2.0%} {essid}",
            max_chars=12,
            update_interval=16,
        ),
        seperator,

        # current sound volume level
        widget.Volume(
            foreground="#a6e3a1",
            fmt="󰕾 {}",
            ),
        seperator,

        # current backlight level
        widget.Backlight(
            foreground="#f9e2af",
            brightness_file="/sys/class/backlight/intel_backlight/brightness", 
            max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness", 
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('arandr')}, 
            fmt="󰛨 {}"),
        seperator,

        # current battery level
        widget.Battery(
            foreground="#f2cdcd",
            format='{char} {percent:2.0%} {hour:d}:{min:02d}'
        ),
        seperator,

        # time
        widget.Clock(
            foreground="#f38ba8",
            format="%H:%M"
        ),
        seperator,
        widget.Clock(
            foreground="#ffffff",
            format="%a %y-%m-%d"
        ),
        widget.Spacer(length=7),
    ]

def flatten(L):
    for item in L:
        try:
            yield from flatten(item)
        except TypeError:
            yield item
widget_list = list(flatten(widgets))

# --------------------------------------------------------
# Screens
# --------------------------------------------------------

screens = [
    Screen(
        wallpaper = "~/.config/qtile/wallpapers/another-world-or-sum.png",
        wallpaper_mode = 'fill',
        top = bar.Bar(
            widget_list,
            30,
            margin=5
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# --------------------------------------------------------
# General Setup
# --------------------------------------------------------

dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {
    "*": InputConfig(natural_scroll=True, tap=True),
}

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTILE"

# HOOK startup
@hook.subscribe.startup
def autostart():
    script = expanduser("~/.config/qtile/scripts/autostart")
    Popen(script)
