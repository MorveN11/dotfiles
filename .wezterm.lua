local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/fish", "-l" }

config.audible_bell = "Disabled"

config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
    left = 15,
    right = 15,
    top = 15,
    bottom = 15,
}

config.disable_default_key_bindings = true

config.keys = {
    {
        key = "+",
        mods = "CTRL|SHIFT",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        key = "_",
        mods = "CTRL|SHIFT",
        action = wezterm.action.DecreaseFontSize,
    },
}

config.color_scheme = "Kanagawa (Gogh)"

config.font = wezterm.font_with_fallback({
    { family = "IosevkaTerm Nerd Font Mono", weight = 600 },
    "Symbols Nerd Font Mono",
    "Noto Color Emoji",
})

config.font_size = 14.0

return config
