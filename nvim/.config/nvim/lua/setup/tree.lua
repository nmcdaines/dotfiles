require'nvim-tree'.setup ({
  actions = {
    open_file = {
      resize_window = true
    }
  },
  auto_reload_on_write = false,
  -- auto_close = false,
  -- nvim_tree_disable_netrw = 0,
  filters = {
    custom = { ".git" },
  },
})
    
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    
vim.api.nvim_set_keymap('n', '<leader>v', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  
