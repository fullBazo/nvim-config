require("config.options")
require("config.keybinds")
require("manage").setup()
require("config.noice")
require("mason").setup()
require("mason-lspconfig").setup() -- adapte le chemin selon ta structure
require("config.lsp")
require("Comment").setup()
require("presence").setup({
	auto_update        = true,
	neovim_image_text  = "Neovim",
	main_image         = "neovim",
	editing_text       = "Editing %s",
	workspace_text     = "Working on %s",
	file_explorer_text = "Browsing files",
	git_commit_text    = "Committing changes",
})
require("bufferline").setup({
	options = {
		mode = "buffers",
		separator_style = "slant",
		show_close_icon = false,
		show_buffer_close_icons = true,
		diagnostics = "nvim_lsp",
	},
})
require("gruvbox").setup({
	contrast = "hard", -- "hard", "soft" ou "" (normal)
	transparent_mode = true,
})
vim.cmd.colorscheme("gruvbox")
