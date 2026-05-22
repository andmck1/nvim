-- highlight and move down and up
vim.keymap.set("v", "J", ":m '>+1<CR>gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv")

-- redo
vim.keymap.set("n", "U", ":red<CR>")

-- keep cursor in the centre during page jumps and searches
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when pasting over something, keep the copied text in the copy buffer
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- leader+y to yank into system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- remove weird Q and q: places
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q:", "<nop>")

-- lsp quick fixes
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--- lsp code actions
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set(
			"n",
			"gD",
			"<cmd>lua vim.lsp.buf.declaration()<cr>",
			opts
		)
		vim.keymap.set(
			"n",
			"gi",
			"<cmd>lua vim.lsp.buf.implementation()<cr>",
			opts
		)
		vim.keymap.set(
			"n",
			"go",
			"<cmd>lua vim.lsp.buf.type_definition()<cr>",
			opts
		)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set(
			"n",
			"gs",
			"<cmd>lua vim.lsp.buf.signature_help()<cr>",
			opts
		)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set(
			"n",
			"<F4>",
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			opts
		)
	end,
})

-- formatting
vim.keymap.set({ "n", "x" }, "<leader>r", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end)

-- split windows
vim.keymap.set("n", "[w", "<C-w>W")
vim.keymap.set("n", "]w", "<C-w>w")

-- vscode
vim.keymap.set("n", "<leader>v", ":!code %<CR>")

-- gdb
vim.keymap.set("n", "<leader>b", function()
	local filepath = vim.fn.expand("%:p")
	local line = vim.fn.line(".")

	local git_root = vim.fn.systemlist(
		"git -C "
			.. vim.fn.shellescape(vim.fn.fnamemodify(filepath, ":h"))
			.. " rev-parse --show-toplevel"
	)[1]

	if vim.v.shell_error ~= 0 or not git_root then
		vim.notify(
			"Not inside a git repository",
			vim.log.levels.ERROR,
			{ title = "Copy Breakpoint" }
		)
		return
	end

	local rel_path = filepath:sub(#git_root + 2)

	local result = string.format("b %s:%d", rel_path, line)
	vim.fn.setreg("+", result)

	vim.notify(result, vim.log.levels.INFO, { title = "Copied Breakpoint" })
end, { desc = "Copy file:line as debugger breakpoint string" })
