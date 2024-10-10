return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        --     vim.cmd("colorscheme rose-pine")
        -- end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "decaycs/decay.nvim",
        name = "decay",
        config = function()
            vim.cmd("colorscheme decay-dark")
        end
    },
}
