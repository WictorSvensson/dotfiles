vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<cr>', { desc = 'cd to current buffer dir' })

-- Inaktivera piltangenter för att tvinga fram hjkl
local modes = { 'n', 'i', 'v' }
for _, mode in ipairs(modes) do
  vim.keymap.set(mode, '<Up>', '<Nop>')
  vim.keymap.set(mode, '<Down>', '<Nop>')
  vim.keymap.set(mode, '<Left>', '<Nop>')
  vim.keymap.set(mode, '<Right>', '<Nop>')
end
