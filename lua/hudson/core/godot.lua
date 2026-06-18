local server_name
local projectfile = vim.fn.getcwd() .. "/project.godot"

if vim.fn.filereadable(projectfile) == 1 then
	if vim.fn.has("win32") == 1 then
		server_name = "127.0.0.1:6004"
	else
		server_name = vim.fn.getcwd() .. "/godothost"
	end
	vim.fn.serverstart(server_name)
end
