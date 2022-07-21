require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  }
})
require("telescope").load_extension('harpoon')

vim.cmd([[
" Using Lua functions
nnoremap <leader>a <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <leader><TAB> <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>, <cmd>lua require("harpoon.ui").nav_next()<cr>
nnoremap <leader>. <cmd>lua require("harpoon.ui").nav_prev()<cr>

" key mapping
nnoremap m1 <cmd>lua require("harpoon.ui").nav_file(1)<cr>
nnoremap m2 <cmd>lua require("harpoon.ui").nav_file(2)<cr>
nnoremap m3 <cmd>lua require("harpoon.ui").nav_file(3)<cr>
nnoremap m4 <cmd>lua require("harpoon.ui").nav_file(4)<cr>
nnoremap m5 <cmd>lua require("harpoon.ui").nav_file(5)<cr>
nnoremap m6 <cmd>lua require("harpoon.ui").nav_file(6)<cr>
nnoremap m7 <cmd>lua require("harpoon.ui").nav_file(7)<cr>
nnoremap m8 <cmd>lua require("harpoon.ui").nav_file(8)<cr>
nnoremap m9 <cmd>lua require("harpoon.ui").nav_file(9)<cr>
]])

