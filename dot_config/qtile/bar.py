from libqtile import bar
from qtile_extras import widget
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras.widget.decorations import RectDecoration

decoration_group = {
    "decorations": [
        RectDecoration(colour="#0f0f0f", radius=10, filled=True, padding_y=5, group=True)
    ],
}

colors = {
    'green':      '#9ece6a',
    'yellow':     '#e0af68',
    'red':        '#f7768e',
    'cyan':       '#73daca',
    'orange':     '#ff9e64',
    'purple':     '#bb9af7'
    }

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(
                    length=10,
                ),
                widget.CurrentLayoutIcon(
                    **decoration_group,
                    fmt='{}',
                    custom_icon_paths=['~/.config/qtile/icons'],
                    padding=10,
                    scale=0.5
                ),
                widget.Spacer(
                    length=10,
                ),
                widget.GroupBox(
                    **decoration_group,
                    highlight_method='line',
                    this_current_screen_border=colors['red'],
                    fontsize=12,
                    active=colors['red'],
                    inactive='#ffffff',
                ),
                widget.Spacer(
                    length=10,
                ),
                widget.Pomodoro(
                    **decoration_group,
                    color_active='#ffffff',
                    color_inactive='#ffffff',
                    color_break='#ffffff',
                    length_pomodori=45,
                    prefix_active='  ',
                    prefix_inactive='  ',
                    prefix_break='Break',
                    prefix_long_break='Long Break',
                    prefix_paused='Paused',
                ),
                widget.Spacer(),
                widget.Mpris2(
                    **decoration_group,
                    fmt='<i>  {}</i>',
                    format="{xesam:title} - {xesam:artist}",
                    mouse_callbacks={
                        "Button3": lazy.widget["mpris2"].next(),
                        "Button4": lazy.spawn("playerctl --player=spotify volume 0.05+"),
                        "Button5": lazy.spawn("playerctl --player=spotify volume 0.05-"),
                    },
                    objname="org.mpris.MediaPlayer2.spotify",
                    width=250,
                    padding=10,
                    # foreground=colors['green'],
                ),
                widget.Spacer(),
                widget.Backlight(
                    **decoration_group,
                    fmt='  {}',
                    backlight_name='intel_backlight',
                    # foreground=colors['yellow']
                ),
                widget.Spacer(
                    length=10,
                ),
                widget.CPU(
                    **decoration_group,
                    fmt='  {}',
                    format='{load_percent}%',
                    # foreground=colors['purple']
                ),
                widget.Spacer(
                    length=10,
                ),
                widget.CheckUpdates(
                        **decoration_group,
                        fmt='{}',
                        display_format='  {updates}',
                        # colour_have_updates=colors['cyan'],
                        # colour_no_updates=colors['green'],
                        no_update_string='󰄳  No Updates'
                ),
                widget.Spacer(
                    length=10,
                ),
                widget.Systray(
                    **decoration_group,
                    icon_size=16,
                    padding=10,
                ),
                widget.Spacer(
                    length=10,
                ),
                widget.Clock(
                    **decoration_group,
                    fmt='  {}',
                    format="%a %d %b %I:%M %p",
                    # foreground=colors['red']
                ),
                widget.Spacer(
                    length=10,
                ),
            ],
            36,
            background="#000000",
            opacity=0.85
       ),
    ),
]
