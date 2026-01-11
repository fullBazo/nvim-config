return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      sort_by = "case_sensitive",
      view = { width = 30, side = "left" },
      renderer = { icons = { show = { file = true, folder = true, git = true } } },
      git = { enable = true, ignore = false, timeout = 500 },
      actions = { open_file = { quit_on_open = true } },
      diagnostics = { enable = true, show_on_dirs = true },

      -- on_attach sécurisé : inclut toutes les touches essentielles
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = "Nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- touches de base pour ouvrir / fermer
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Parent"))

        -- touches optionnelles / supplémentaires
        vim.keymap.set("n", "a", api.fs.create, opts("Create"))
        vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
        vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
        vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
        vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
        vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end,
    })

    -- raccourci global pour ouvrir Nvim-tree
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end
}

