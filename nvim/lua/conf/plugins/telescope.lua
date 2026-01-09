return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git/",
        },
      },
    })

    -- Supprime tout mapping fantôme
    pcall(vim.keymap.del, "n", "<leader>fg")
    pcall(vim.keymap.del, "n", "<leader>ff")

    -- Fonction ultra-safe : git si possible, sinon find_files
    local function safe_find_files()
      local ok = pcall(function()
        builtin.git_files({ show_untracked = true })
      end)
      if not ok then
        builtin.find_files({ hidden = true })
      end
    end

    -- Mappings
    vim.keymap.set("n", "<leader>fg", safe_find_files, { desc = "Find files (safe)" })
    vim.keymap.set("n", "<leader>ff", safe_find_files, { desc = "Find files (safe)" })
    vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", function()
      builtin.find_files({ hidden = true })
    end, { desc = "Hidden files" })
  end,
}

