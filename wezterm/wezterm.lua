local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
    local leader = ''
    if window:leader_is_active() then
        leader = 'LEADER'
    end
    window:set_right_status(leader)
end)

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Fonts
config.font_size = 18.0
-- NerdFont is built-in to WezTerm and is not specified.
-- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
config.font = wezterm.font('Ricty Diminished for Powerline')
config.use_ime = true

-- UI: General
config.color_scheme = "Catppuccin Macchiato"
config.window_decorations = "RESIZE"
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10
}
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.show_new_tab_button_in_tab_bar = false
config.bold_brightens_ansi_colors = true
config.inactive_pane_hsb = {
    hue = 1.0,
    saturation = 0.7,
    brightness = 1.0
}

-- UI: Change tab color
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local background = "#5c6d74"
    local foreground = "#FFFFFF"

    if tab.is_active then
        background = "#ae8b2d"
        foreground = "#FFFFFF"
    end

    local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

    return {{
        Background = {
            Color = background
        }
    }, {
        Foreground = {
            Color = foreground
        }
    }, {
        Text = title
    }}
end)

-- Key Binding
config.leader = {
    key = 'o',
    mods = 'CMD',
    timeout_milliseconds = 10000
}

config.keys = {{
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
        direction = 'Down'
    }
}, {
    key = '\\',
    mods = 'LEADER',
    action = act.SplitPane {
        direction = 'Right'
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

return config
