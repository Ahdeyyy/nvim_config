local transparency = 0.9
local cursor_vfx_mode = "railgun"
local scroll_animation_length = 0.3
local hide_mouse_when_typing = false
local cursor_trail_size = 0.8
local cursor_animation_length = 0.26
local refresh_rate_idle = 5
vim.api.nvim_set_var(
	"neovide_transparency",transparency
)
vim.api.nvim_set_var(
	"neovide_cursor_vfx_mode", cursor_vfx_mode
)vim.api.nvim_set_var(
	"neovide_scroll_animation_length",scroll_animation_length
)
vim.api.nvim_set_var(
	"neovide_hide_mouse_when_typing", hide_mouse_when_typing
)vim.api.nvim_set_var(
	"neovide_cursor_trail_size",cursor_trail_size
)
vim.api.nvim_set_var(
	"neovide_cursor_animation_length", cursor_animation_length
)vim.api.nvim_set_var(
	"neovide_refresh_rate_idle",refresh_rate_idle
)

