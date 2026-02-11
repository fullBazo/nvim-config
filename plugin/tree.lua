local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

nvim_tree.setup({
	on_attach = function(bufnr)
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
		-- Mappings LOCAUX au tree (navigation dans l'arbre)
		vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
		vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up Directory"))
		vim.keymap.set("n", "R", api.fs.rename, opts("Rename"))
		vim.keymap.set("n", "a", api.fs.create, opts("Create"))
		vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
		vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		-- RETIRE leader+e et leader+f d'ici
	end,
	filters = {
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 30,
		side = "left",
	},
})

vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>f", api.tree.focus, { desc = "Focus Explorer" })
