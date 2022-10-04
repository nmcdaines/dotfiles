require("telescope").setup({
  defaults = { file_ignore_patterns = {".git", "node_modules", ".next", "tmp", "dist", "obj", "bin"} }
})

-- vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope file_files<CR>', { silent = true })

vim.cmd([[
" Using Lua functions
nnoremap <C-p> <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>p <cmd>Telescope harpoon marks<cr>
]])
