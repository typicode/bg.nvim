local handle = io.popen("tty")
local tty = handle:read("*a")
handle:close()

local reset = function()
	os.execute('printf "\\033]111" >' .. tty)
end

local update = function()
	local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
	local hex = string.format("#%06x", bg)
	os.execute('printf "\\033]11;' .. hex .. '" > ' .. tty)
end

local setup = function()
	vim.api.nvim_create_autocmd({ "ColorScheme" }, { callback = update })
	vim.api.nvim_create_autocmd({ "VimLeavePre" }, { callback = reset })
end

setup()
