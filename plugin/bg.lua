local tty = vim.uv.new_tty(1, false)
if tty == nil then
	-- Standard out is not a terminal
	return
end

local update_count = 0

local reset = function()
	if os.getenv("TMUX") then
		tty:write("\x1bPtmux;\x1b\x1b]111\x07\x1b\\")
	elseif os.getenv("TERM") == "xterm-kitty" then
		for _ = 1, update_count do
			tty:write("\x1b]30101\x07")
		end
	else
		tty:write("\x1b]111\x07")
	end
end

local update = function()
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false, create = false })
	local bg = normal.bg
	local fg = normal.fg
	if bg == nil then
		return reset()
	end

	local bghex = string.format("#%06x", bg)
	local fghex = string.format("#%06x", fg)

	if os.getenv("TERM") == "xterm-kitty" then
		tty:write("\x1b]30001\x07")
	end

	if os.getenv("TMUX") then
		tty:write("\x1bPtmux;\x1b\x1b]11;" .. bghex .. "\x07\x1b\\")
		tty:write("\x1bPtmux;\x1b\x1b]12;" .. fghex .. "\x07\x1b\\")
	else
		tty:write("\x1b]11;" .. bghex .. "\x07")
		tty:write("\x1b]12;" .. fghex .. "\x07")
	end

	update_count = update_count + 1
end

local setup = function()
	vim.api.nvim_create_autocmd({ "ColorScheme", "UIEnter" }, { callback = update })
	vim.api.nvim_create_autocmd({ "VimLeavePre", "VimSuspend" }, { callback = reset })
end

setup()
