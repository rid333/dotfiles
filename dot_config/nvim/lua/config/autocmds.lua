local group = vim.api.nvim_create_augroup("ClearBuffer", { clear = true })

-- Highligh when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	pattern = "/home/alridho/.config/nvim/**/*.lua",
	callback = function()
		vim.cmd("silent source %")
	end,
})

-- Change indent space for c
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "c", "cpp" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.schedule(function()
				vim.cmd.nohlsearch()
			end)
		end
	end,
})

-- Built-in cmp
-- vim.o.completeopt = "menu,noinsert,popup,fuzzy"
--
-- local pumMaps = {
-- 	["<Tab>"] = "<C-n>",
-- 	["<S-Tab>"] = "<C-p>",
-- 	["<Down>"] = "<C-n>",
-- 	["<Up>"] = "<C-p>",
-- 	["<CR>"] = "<C-y>",
-- }
-- for insertKmap, pumKmap in pairs(pumMaps) do
-- 	vim.keymap.set("i", insertKmap, function()
-- 		return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
-- 	end, { expr = true })
-- end

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
-- 		client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
-- 		vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method("textDocument/completion") then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
vim.diagnostic.config({
	virtual_text = true,
})
