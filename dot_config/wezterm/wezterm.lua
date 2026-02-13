local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Use WebGPU for better performance
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- Set Nushell as the default shell
-- This path is standard for Mac with Apple Silicon
-- To find the path on your system, run `which nu` in Terminal.app
config.default_prog = { "/opt/homebrew/bin/nu" }

-- Get the home directory (works on both macOS and Windows)
local home = os.getenv("HOME") or os.getenv("USERPROFILE") or ""

-- Set XDG_CONFIG_HOME environment variable for Nushell
config.set_environment_variables = {
	XDG_CONFIG_HOME = home .. "/.config",
} -- Shell integration
config.set_environment_variables = {
	TERM_PROGRAM = "WezTerm",
}

-- Font configuration
config.font = wezterm.font("JetBrains Mono")

-- Theme
config.color_scheme = "Dracula"

-- Mouse behavior
config.hide_mouse_cursor_when_typing = true

-- Scrollback
config.scrollback_lines = 1000000

-- Leader key configuration
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Key bindings
config.keys = {
	-- Tab navigation
	{ key = "n", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "CTRL", action = wezterm.action.ActivateTabRelative(-1) },

	-- Leader key bindings (Ctrl+A prefix)
	{ key = "n", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "q", mods = "LEADER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

	-- Split navigation (Super+Alt combinations)
	{ key = "h", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD|CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	-- Pane resizing with Super+Alt (matching your Neovim bindings)
	{ key = ",", mods = "CMD|CTRL", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) }, -- Cmd+Alt+, : Decrease width by 5
	{ key = ".", mods = "CMD|CTRL", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) }, -- Cmd+Alt+. : Increase width by 5
	{ key = "t", mods = "CMD|CTRL", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) }, -- Cmd+Alt+t : Increase height by 1
	{ key = "s", mods = "CMD|CTRL", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) }, -- Cmd+Alt+s : Decrease height by 1

	-- Split creation (Ctrl+A prefix)
	{ key = "s", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Toggle split zoom
	{ key = "f", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- Send Ctrl+A to the terminal (double-tap)
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },

	{ key = "c", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
}

-- Window state saving (WezTerm handles this automatically)
config.automatically_reload_config = true

return config
