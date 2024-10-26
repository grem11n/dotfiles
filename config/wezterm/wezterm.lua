-- Load WezTerm API
local wezterm = require 'wezterm'
-- Init config
local config = wezterm.config_builder()

-- Start tmux by default
config.default_prog = { '/opt/homebrew/bin/tmux', 'new-session', '-A', '-D', '-s', 'main' }
-- Disable system window decorations
config.window_decorations = "NONE"
-- Disable Wezterm's tabs, because Tmux has them
config.enable_tab_bar = false
-- See-through window
config.window_background_opacity = 0.90
-- Color scheme
config.color_scheme = "Ayu Mirage"
--config.color_scheme = "Builtin Dark",
--Fonts config
config.font = wezterm.font_with_fallback({
    'Mononoki Nerd Font',
    'Agave Nerd Font',
    --'Martian Mono',
    --'Iosevka Nerd Font',
    --'VictorMono Nerd Font',
})
config.font_size = 20.0

-- Open web links on mouse click
config.mouse_bindings = {
    -- Disable the default click behavior
    {
      event = { Up = { streak = 1, button = "Left"} },
      mods = "NONE",
      action = wezterm.action.DisableDefaultAssignment,
    },
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CMD",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "CMD",
        action = wezterm.action.Nop,
    },
}

return config
