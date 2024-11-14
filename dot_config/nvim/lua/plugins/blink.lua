return {
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'enter',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<C-p>'] = { 'snippet_backward', 'fallback' },
                ['<C-n>'] = { 'snippet_forward', 'fallback' },
            },
            highlight = {
                use_nvim_cmp_as_default = true,
            },
            nerd_font_variant = 'mono',
            trigger = {
                completion = {
                    show_in_snippet = false,
                },
            },
            windows = {
                autocomplete = {
                    selection = "manual"
                },
            },

            -- experimental auto-brackets support
            -- accept = { auto_brackets = { enabled = true } }

            -- experimental signature help support
            -- trigger = { signature_help = { enabled = true } }
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers or {}) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    }
}
