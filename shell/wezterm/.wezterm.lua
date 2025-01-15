-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }

config.term = "xterm-256color"
config.color_scheme = "Zenburn"
config.font = wezterm.font "0xProto Nerd Font Mono"
config.window_background_opacity = 0.1

config.window_padding = {
	left = 14,
	right = 14,
	top = 34,
	bottom = 14,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size= { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size= { Percent = 50 },
		}),
	},
	{
		key = "O",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

return config
