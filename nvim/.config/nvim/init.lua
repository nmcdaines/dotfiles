-- Inspiration
-- https://github.com/jiajiawang/dotfiles/tree/master/vim
-- https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f

require('plugins')

-- options
vim.o.shell = "/bin/zsh"
vim.g.mapleader='\\'
vim.opt.clipboard = 'unnamedplus'

vim.cmd([[
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
end
]])

-- General Settings
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.encoding = 'UTF-8'

vim.opt.splitright = true

-- TODO: statusline
vim.cmd([[
set statusline=
set statusline+=%#NonText#
set statusline+=%=
set statusline+=\ %f
set statusline+=\ 
set statusline+=%#CursorLineNr#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#IncSearch#
set statusline+=\ %l/%L
set statusline+=\ [%c]
]])

-- TODO: move to the plugins file
vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent_sidebar = true


-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.o.termguicolors=true
-- vim.o.background = 'dark'
vim.cmd([[colorscheme tokyonight]])

-- tmux
vim.cmd([[
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
]])

-- Goyo Settings
-- https://github.com/makccr/dot/blob/master/.config/nvim/init.vim
vim.cmd([[
  function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
  endfunction
  
  function! s:goyo_leave()
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
  endfunction
  
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()

  nnoremap <leader><ENTER> :Goyo<CR>
]])


-- commentary settings
vim.cmd([[autocmd FileType ruby setlocal commentstring=#\ %s]])
vim.api.nvim_set_keymap('', '\\', ':Commentary<CR>', { noremap= true })

-- coc
vim.cmd([[
  hi CocUnderline gui=undercurl term=undercurl
  hi CocErrorHighlight ctermfg=red guifg=#c4384b gui=undercurl term=undercurl
  hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl
]])

vim.cmd([[
  nmap <silent> [e <Plug>(coc-diagnostic-prev)
  nmap <silent> ]e <Plug>(coc-diagnostic-next)
]])

-- mapping
vim.api.nvim_set_keymap('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })

--autocmd
-- vim.cmd([[]])


vim.cmd([[
  set relativenumber
]])


-- vim.opt.updatetime = 50

vim.opt.updatetime = 100


vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])

vim.cmd([[
" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>ct :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
endif
]])


-- code folding
vim.cmd([[
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
]])

-- reload config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- create scss file for jsx (rangeme project)
function create_scss()
  current_path = vim.fn.expand('%')
  updated_extension, _ = string.gsub(current_path,"jsx", "scss")
  updated_path, _ = string.gsub(updated_extension, "javascripts", "stylesheets")

  file = io.open(updated_path, "w")

  if file ~= nul then
  else
    io.write(vim.fn.expand('%:p'))
  end

  file:close()

  print("created stylesheet:" .. updated_path)
end


vim.api.nvim_create_user_command('SCSS', create_scss, {})

-- using netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- ================
-- keymap for netrw

-- vim.api.nvim_set_keymap('n', '<leader>f', ':Lexplore<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>g', ':Lexplore %:p:h<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'dd', ':Lexplore %:p:h<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'da', ':Lexplore<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>v', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
-- nnoremap <leader>dd :Lexplore %:p:h<CR>
-- nnoremap <Leader>da :Lexplore<CR>
