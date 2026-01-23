require("config.options")
require("config.keybinds")
require("manage").setup()
require("config.noice")
require("mason").setup()
require("mason-lspconfig").setup() -- adapte le chemin selon ta structure
require("config.lsp")
