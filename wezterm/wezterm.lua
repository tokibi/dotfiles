local wezterm = require 'wezterm'
local act = wezterm.action

return {
    -- Fonts
    font_size = 18.0,
    -- NerdFont is built-in to WezTerm and is not specified.
    -- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    font = wezterm.font('Ricty Diminished for Powerline'),

    bold_brightens_ansi_colors = true,
    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 0.7,
        brightness = 1.0
    },

    -- UI
    -- color_scheme = "OneHalfDark",
    color_scheme = "Catppuccin Macchiato",
    window_decorations = "RESIZE",
    window_padding = {
        left = 15,
        right = 15,
        top = 10,
        bottom = 10,
    },

    -- Key Binding
    leader = {
        key = 'k',
        mods = 'CMD',
        timeout_milliseconds = 1000
    },
    keys = {{
        key = '@',
        mods = 'CTRL',
        action = act.DisableDefaultAssignment
    }, {
        key = 'r',
        mods = 'LEADER|CMD',
        action = act.ReloadConfiguration
    }, {
        key = 'LeftArrow',
        mods = 'CMD',
        action = act.SendKey {
            key = 'a',
            mods = 'CTRL'
        }
    }, {
        key = 'RightArrow',
        mods = 'CMD',
        action = act.SendKey {
            key = 'e',
            mods = 'CTRL'
        }
    }, {
        key = '-',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Down',
        }
    }, {
        key = '¥',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Right',
        }
    }, {
        key = '[',
        mods = 'CMD',
        action = act.ActivatePaneDirection "Prev"
    }, {
        key = ']',
        mods = 'CMD',
        action = act.ActivatePaneDirection "Next"
    }, {
        key = '[',
        mods = 'OPT',
        action = act.ActivateTabRelative(-1)
    }, {
        key = ']',
        mods = 'OPT',
        action = act.ActivateTabRelative(1)
    }, {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentPane {
            confirm = false
        }
    }, {
        key = ';',
        mods = 'CMD|CTRL',
        action = wezterm.action.IncreaseFontSize
    }}

}
