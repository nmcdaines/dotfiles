require("telescope").setup({})

-- vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope file_files<CR>', { silent = true })

vim.cmd([[
" Using Lua functions
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>p <cmd>Telescope harpoon marks<cr>
]])
