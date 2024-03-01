ts = require('nvim-treesitter.configs')

ts.setup {
	ensure_installed = { "cpp", "lua", "vim", "vimdoc", "python", "svelte", "typescript", "javascript", "rust", "svelte" },
	auto_install = false,
	sync_install = false,
	highlight = {
		enable = true,
	},
	additional_vim_regex_highlighting = false,
}
