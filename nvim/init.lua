require('config.options')
require('config.keybinds')
--require('config.lazy')
-- init.lua
vim.opt.runtimepath:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup{
                ensure_installed = { "lua", "python" },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    }
})

