local tstools_status, tstools = pcall(require, "typescript-tools")
if not tstools_status then
	return
end

local keymap = vim.keymap

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>", opts)
	keymap.set("n", "<leader>si", "<cmd>TSToolsSortImports<CR>", opts)
	keymap.set("n", "<leader>ri", "<cmd>TSToolsRemoveUnusedImports<CR>", opts)
	keymap.set("n", "<leader>ru", "<cmd>TSToolsRemoveUnused<CR>", opts)
	keymap.set("n", "<leader>am", "<cmd>TSToolsAddMissingImports<CR>", opts)
	keymap.set("n", "<leader>fa", "<cmd>TSToolsFixAll<CR>", opts)
	keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<CR>", opts)
	keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
end

tstools.setup({
	on_attach = on_attach,
	-- handlers = { ... },
	-- ...
	settings = {
		-- spawn additional tsserver instance to calculate diagnostics on it
		separate_diagnostic_server = true,
		-- "change"|"insert_leave" determine when the client asks the server about diagnostic
		publish_diagnostic_on = "insert_leave",
		-- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
		-- specify commands exposed as code_actions
		expose_as_code_action = {},
		-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
		-- not exists then standard path resolution strategy is applied
		tsserver_path = nil,
		-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
		-- (see 💅 `styled-components` support section)
		tsserver_plugins = {},
		-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
		-- memory limit in megabytes or "auto"(basically no limit)
		tsserver_max_memory = "200",
		-- described below
		tsserver_format_options = {
			placeOpenBraceOnNewLineForFunctions = true,
		},
		tsserver_file_preferences = {},
		-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
		complete_function_calls = true,
	},
})
