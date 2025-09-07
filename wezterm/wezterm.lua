local wezterm = require("wezterm")
local c = wezterm.config_builder()
local act = wezterm.action

c.color_scheme = "Catppuccin Frappe"

c.font = wezterm.font_with_fallback({
	{
		family = "Iosevka Nerd Font",
		style = "Normal",
		weight = "Regular",
		italic = false,
	},
})

c.default_prog = { "/usr/bin/fish", "-l" }

c.window_background_opacity = 0.8

c.cell_width = 0.85

c.front_end = "OpenGL"

c.font_size = 18
c.command_palette_font_size = c.font_size * 1.1

c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = true

c.audible_bell = "Disabled"

c.adjust_window_size_when_changing_font_size = false
c.window_padding = { left = 0, right = 0, top = 15, bottom = 0 }

c.inactive_pane_hsb = { brightness = 0.90 }

-- ligatures
c.harfbuzz_features = { "calt=0" }

-- TODO: Explore https://github.com/nekowinston/dotfiles/blob/main/home/apps/wezterm/wezterm.lua
c.keys = {
	{
		key = "\\",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "p",
		mods = "ALT",
		action = act.ActivatePaneDirection("Prev"),
	},
	{
		key = "n",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "f",
		mods = "ALT",
		action = act.TogglePaneZoomState,
	},
	{
		key = "/",
		mods = "ALT",
		action = act.Search({ CaseInSensitiveString = "" }),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = "DisableDefaultAssignment",
	},
	{
		key = "Tab",
		mods = "ALT",
		action = "ActivateLastTab",
	},
	{
		key = "c",
		mods = "ALT",
		action = "ActivateCopyMode",
	},
}

c.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(-3),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(3),
	},
}

local map = function(key, mods, action)
	if type(mods) == "string" then
		table.insert(c.keys, { key = key, mods = mods, action = action })
	elseif type(mods) == "table" then
		for _, mod in pairs(mods) do
			table.insert(c.keys, { key = key, mods = mod, action = action })
		end
	end
end

for i = 1, 9 do
	map(tostring(i), { "ALT" }, act.ActivateTab(i - 1))
end

return c
