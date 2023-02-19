local M = {}

local set = function(color)
	os.execute('printf "\\033]11;' .. color .. '\\007" > $(tty) 2> /dev/null')
end

M.update = function()
	local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
	local hex = string.format("#%06x", bg)
	set(hex)
end

M.setup = function(opts)
	vim.api.nvim_create_autocmd({ "ColorScheme" }, { callback = M.update })
	vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
		callback = function()
			set(opts["term"])
		end,
	})
end

return M
