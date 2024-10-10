local group = vim.api.nvim_create_augroup('ClearBuffer', { clear = true })

-- Highligh when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Reload config file on change
vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    pattern = "/home/alridho/.config/nvim/**/*.lua",
    callback = function()
        vim.cmd('silent source %')
    end
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
