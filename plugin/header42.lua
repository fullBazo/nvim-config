-- Configuration du plugin 42-header
require('42header').setup({
  default_map = true,
  auto_update = true,
  user = 'ehuet',
  mail = 'ehuet@student.42.fr',
})

-- Raccourcis supplémentaires
vim.keymap.set('n', '<leader>h', '<cmd>Stdheader<cr>', { desc = '42 Header' })
