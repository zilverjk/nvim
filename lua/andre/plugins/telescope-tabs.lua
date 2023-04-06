local status, telescope_tabs = pcall(require, "telescope-tabs")
if not status then
	return
end

telescope_tabs.setup({
	show_preview = false,
	entry_formatter = function(tab_id, buffer_ids, file_names, file_paths)
		local entry_string = table.concat(file_names, ", ")
		return string.format("%d: %s", tab_id, entry_string)
	end,
})
