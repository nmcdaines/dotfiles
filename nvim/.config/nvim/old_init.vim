call plug#begin()
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color' | Plug 'https://github.com/shmargum/vim-sass-colors.git'
Plug 'navarasu/onedark.nvim'
Plug 'kyazdani42/nvim-web-devicons' | Plug 'romgrk/barbar.nvim'
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

"General Settings
set number
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
end

set encoding=UTF-8

"Status Line
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

"Color Settings
"let g:onedark_style = 'darker'
"colorscheme onedark

let g:tokyonight_style = "night"
colorscheme tokyonight

"set background=dark
"set termguicolors
"let g:limelight_conceal_ctermfg = 240
"let g:limelight_conceal_guifg = '#777777'


" These are required for tmux
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"Key-bindings
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader><Space> :CtrlP<CR>
noremap \ :Commentary<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

map ] :NERDTreeFind<CR>

"Inspiration
"- https://github.com/makccr/dot/blob/master/.config/nvim/init.vim

"Goyo Settings
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
  "hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"NerdTree
let NERDTreeIgnore = ['^node_modules$[[dir]]']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Commentary settings
autocmd FileType ruby setlocal commentstring=#\ %s

" let g:nvim_web_devicons_enable = 1
set guifont=FiraMono\ Nerd\ Font:h13

set clipboard=unnamedplus

hi CocUnderline gui=undercurl term=undercurl
hi CocErrorHighlight ctermfg=red guifg=#c4384b gui=undercurl term=undercurl
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl

nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)


