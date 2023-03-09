-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

local config = {
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
}

-- configure/enable gitsigns
gitsigns.setup(config)
