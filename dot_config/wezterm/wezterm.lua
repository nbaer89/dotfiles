local wezterm = require("wezterm")
local config = wezterm.config_builder()
local opacity = 0.5
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

--- Get the current operating system
-- @return "windows"| "linux" | "macos"
local function get_os()
	local bin_format = package.cpath:match("%p[\\|/]?%p(%a+)")
	if bin_format == "dll" then
		return "windows"
	elseif bin_format == "so" then
		return "linux"
	elseif bin_format == "dylib" then
		return "macos"
	end
end
local host_os = get_os()
local act = wezterm.action
local launch_menu = {}

wezterm.gui.enumerate_gpus()

config.launch_menu = launch_menu

-- Font Configuration
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11

-- Color Configuration
config.colors = theme.colors()
config.force_reverse_video_cursor = true
config.window_frame = theme.window_frame()

-- Window Configuration
config.initial_rows = 45
config.initial_cols = 180
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = opacity
config.window_close_confirmation = "NeverPrompt"
config.win32_system_backdrop = "Acrylic"

-- Tab Bar Configuration
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false
config.colors.tab_bar = {
	background = transparent_bg,
	new_tab = { fg_color = config.colors.background, bg_color = config.colors.brights[6] },
	new_tab_hover = { fg_color = config.colors.background, bg_color = config.colors.foreground },
}

-- Tab Formatting
wezterm.on("format-tab-title", function(tab, _, _, _, hover)
	local background = config.colors.brights[1]
	local foreground = config.colors.foreground

	if tab.is_active then
		background = config.colors.brights[7]
		foreground = config.colors.background
	elseif hover then
		background = config.colors.brights[8]
		foreground = config.colors.background
	end

	local title = tostring(tab.tab_index + 1)
	return {
		{ Foreground = { Color = background } },
		{ Text = "█" },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Foreground = { Color = background } },
		{ Text = "█" },
	}
end)

-- Performance Settings
config.max_fps = 120
config.animation_fps = 60

-- Cursor Config
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 250

-- Keybinds
config.use_dead_keys = false
config.disable_default_key_bindings = true
config.keys = {
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},
	{ key = "PageUp", action = wezterm.action.ScrollByPage(-1) },
	{ key = "PageDown", action = wezterm.action.ScrollByPage(1) },
}
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

-- Default Shell
config.default_prog = { "nu" }

-- OS Specific Overrides
if host_os == "linux" then
	config.defualt_prog = { "zsh" }
	config.front_end = "WebGpu"
	config.window_decorations = nil
end

return config
