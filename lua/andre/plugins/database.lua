local status, db = pcall(require, "config.dadbod")
if not status then
	return
end

vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_win_position = "left"
vim.g.db_ui_winwidth = 80

vim.g.db_ui_table_helpers = {
	mysql = {
		Count = "select count(1) from {optional_schema}{table}",
		Explain = "EXPLAIN {last_query}",
	},
	sqlite = {
		Describe = "PRAGMA table_info({table})",
	},
	postgresql = {
		Count = "select count(1) from {optional_schema}{table}",
	},
}

vim.g.db_ui_icons = {
	expanded = {
		db = "▾ ",
		buffers = "▾ ",
		saved_queries = "▾ ",
		schemas = "▾ ",
		schema = "▾ פּ",
		tables = "▾ 藺",
		table = "▾ ",
	},
	collapsed = {
		db = "▸ ",
		buffers = "▸ ",
		saved_queries = "▸ ",
		schemas = "▸ ",
		schema = "▸ פּ",
		tables = "▸ 藺",
		table = "▸ ",
	},
	saved_query = "",
	new_query = "璘",
	tables = "離",
	buffers = "﬘",
	add_connection = "",
	connection_ok = "✓",
	connection_error = "✕",
}

local keymap = vim.keymap
keymap.set("n", "<F4>", ":tab DBUI<cr>")

db.setup()
