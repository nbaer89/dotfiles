-- These are the basic's for using wezterm.
-- Mux is the mutliplexes for windows etc inside of the terminal
-- Action is to perform actions on the terminal
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- These are vars to put things in later (i dont use em all yet)
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- This is for newer wezterm vertions to use the config builder 
if wezterm.config_builder then
  config = wezterm.config_builder()
end
config.window_background_opacity = 0.9
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.color_scheme = 'Rosé Pine (Gogh)'
-- This is my chosen font, we will get into installing fonts on windows later
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 11
config.launch_menu = launch_menu
-- makes my cursor blink 
config.default_cursor_style = 'BlinkingBar'
config.use_dead_keys = false
config.disable_default_key_bindings = true
config.initial_rows = 30
config.initial_cols = 120
-- this adds the ability to use ctrl+v to paste the system clipboard 
config.keys = {
  {
    key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard'
  },
  { key = 'PageUp', action = wezterm.action.ScrollByPage(-1) },
  { key = 'PageDown', action = wezterm.action.ScrollByPage(1) },

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
config.default_prog = { 'C:/Users/nbaer/AppData/Local/Microsoft/WindowsApps/Microsoft.PowerShell_8wekyb3d8bbwe/pwsh.exe' }

-- Visual bell
config.audible_bell = 'Disabled'
config.visual_bell = {
	target = "CursorColor",
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 300,
}
return config