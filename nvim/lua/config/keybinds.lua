-- KEYBINDS
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Alt Up/Down in vscode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")       -- Remap joining lines
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor in place while moving up/down page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")       -- center screen when looping search results
vim.keymap.set("n", "N", "Nzzzv")

-- paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- sometimes in insert mode, control-c doesn't exactly work like escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- add binds for Control J/K to scroll thru quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- What the heck is Ex mode?
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- getting Alex off my back :)
vim.keymap.set("n", "<leader>dg", "<cmd>DogeGenerate<cr>")

-- lint / format php files for LC
vim.keymap.set("n", "<leader>cc", "<cmd>!php-cs-fixer fix % --using-cache=no<cr>")

-- Replace all instances of whatever is under cursor (on line)
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- yank into clipboard even if on ssh
vim.keymap.set('n', '<leader>y', '<Plug>OSCYankOperator')
vim.keymap.set('v', '<leader>y', '<Plug>OSCYankVisual')

-- reload without exiting vim
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Quickfix list stuff
vim.keymap.set("n", "<leader>cl", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP Info" })

-- run make in current working directory
vim.keymap.set("n", "<leader>mm", "<cmd>make<CR>")

-- source file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")


	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
end)

--autoindentation 42 hehe je suis le goat
vim.keymap.set('n', '<leader>n', function()
	-- Convertit espaces en tabs
	vim.cmd('set noexpandtab')
	vim.cmd('retab!')

	-- Réindente tout
	vim.cmd('normal! ggVG=')

	-- Supprime espaces en fin de ligne
	vim.cmd('%s/\\s\\+$//e')

	-- Supprime lignes vides en fin de fichier
	vim.cmd('%s/\\n\\+\\%$//e')

	print("Formaté selon la norme 42 ✓")
end, { desc = "Format selon norme 42" })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Agrandir hauteur" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Réduire hauteur" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Réduire largeur" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Agrandir largeur" })

-- Navigation entre splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Fenêtre gauche" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Fenêtre bas" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Fenêtre haut" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Fenêtre droite" })

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Onglet suivant" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Onglet précédent" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Fermer onglet" })
