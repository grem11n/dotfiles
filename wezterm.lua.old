local wezterm = require 'wezterm'
local act = wezterm.action

return {
  --font = wezterm.font 'FiraCode Nerd Font Mono',
  font = wezterm.font_with_fallback({
    'Mononoki Nerd Font',
    'Agave Nerd Font',
    --'Martian Mono',
    --'Iosevka Nerd Font',
    --'VictorMono Nerd Font',
  }),
  font_size = 20,
  color_scheme = "Builtin Dark",
  --color_scheme = 'Builtin Light',
  window_background_opacity = 0.90,

  keys = {
    -- This will create a new split and run your default program inside it
    {
      key = 'd',
      mods = 'CMD',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'd',
      mods = 'CMD|SHIFT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'w',
      mods = 'CMD',
      action = act.CloseCurrentPane { confirm = true },
    },
    { key = 't',
      mods = 'CMD',
      action = act.SpawnCommandInNewTab {
          domain = 'DefaultDomain',
          cwd = '~/'
      },
    },
    {
      key = 'c',
      mods = 'CMD',
      action = act.CopyTo 'Clipboard',
    },
    {
      key = '[',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Prev',
    },
    {
      key = ']',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Next',
    },
    { key = 'LeftArrow', mods = 'CMD', action = act.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'CMD', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow', mods = 'CMD|SHIFT', action = act.MoveTabRelative(-1) },
    { key = 'RightArrow', mods = 'CMD|SHIFT', action = act.MoveTabRelative(1) },
    { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
  },
  -- Mouse actions config
  -- Open URLs by CMD + click instead of a simple click
  mouse_bindings = {
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
  },
}
