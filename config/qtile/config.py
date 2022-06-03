import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

DEFALT_MARGIN = 5
DEFAULT_MARGIN_ON_SINGLE = 5
DEFALT_BORDER_WIDTH = 2

mod = "mod4"
terminal = "alacritty"

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"

keys = [
    # Switch between windows
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
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen mode"),
    Key([mod,  "shift"], "c", lazy.window.kill(), desc="Close focused window"),

	Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
	Key([mod], "Tab", lazy.screen.toggle_group(), desc="Toggle between previous and current group"),
	Key([mod,  "shift"], "e", lazy.spawn("qtile_exit.sh"), desc="Run the shutdown script"),
	Key([mod], "n", lazy.layout.next(), desc="Move window focus to other window"),
	Key([mod,  "shift"], "n", lazy.next_layout(), desc="Toggle between layouts"),
	Key([mod], "d", lazy.spawn("rofi -show run"), desc="Launch app launcher"),
	Key([mod], "Print", lazy.spawn("flameshot gui"), desc="Launch screenshot utility"),

	# Audio control
    Key([mod], "F1", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Mute audio"),
    Key([mod], "F2", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Volume down"),
    Key([mod], "F3", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Volume up"),

	# TODO: brightness control
    # Key([mod], "F4", lazy.spawn("light -A 1"), desc="Volume up"),
    # Key([mod], "F5", lazy.spawn("light -U 1"), desc="Volume up"),
]

groups = [Group(i) for i in "12345"]
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

column_layout_theme = {
    "border_focus": "#88C0D0",
    "border_focus_stack": "#88C0D0",
    "border_normal": "#3b4252",
    "border_normal_stack": "#3b4252",
    "border_width": DEFALT_BORDER_WIDTH,
    "margin": DEFALT_MARGIN,
    "margin_on_single": DEFAULT_MARGIN_ON_SINGLE,
}

layouts = [
    layout.Columns(**column_layout_theme),
]

widget_defaults = dict(
    font="RobotoMono Nerd Font",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

group_box_settings = {
    "padding": 5,
    "borderwidth": 4,
    "active": "#88C0D0",
    "inactive": "#616e88",
    "foreground": "#d8dee9",
    "background": "#2e3440",
    "urgent_border": "#BF616A",
    "highlight_color": "#88C0D0",
    "this_current_screen_border": "#88C0D0",
    "this_screen_border": "#88C0D0",
    "other_current_screen_border": "#2e3440",
    "other_screen_border": "#2e3440",
    "highlight_method": "border",
    "disable_drag": True,
}

screens = [
    Screen(
		wallpaper="~/pictures/wallpapers/mountains.jpg",
        top=bar.Bar(
            [
                widget.GroupBox(**group_box_settings),
				widget.Spacer(),
                widget.Clock(format="%a %I:%M %p"),
            ],
            30,
			background="#2e3440",
			margin=DEFALT_MARGIN,
        ),
		right=bar.Gap(DEFALT_MARGIN),
		left=bar.Gap(DEFALT_MARGIN),
		bottom=bar.Gap(DEFALT_MARGIN),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]


float_layout_theme = {
    "border_focus": "#88C0D0",
    "border_normal": "#3b4252",
    "border_width": DEFALT_BORDER_WIDTH,
}

floating_layout = layout.Floating(
    **float_layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
