" Enable vim-plug & various plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'arcticicestudio/nord-vim'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'junegunn/vim-easy-align'
	Plug 'jiangmiao/auto-pairs'
call plug#end()

" Basic vim prefs
set relativenumber
set cursorline
set numberwidth=4
set tabstop=4
set shiftwidth=4

" Nord colour scheme
set termguicolors
let g:nord_comment_brightness=10
colorscheme nord

" Some handy keymaps
autocmd vimenter * NERDTree
autocmd vimenter * wincmd w

" Custom statusbar
set laststatus=2
set statusline=
set statusline+=%2*\ %l
set statusline+=\ %*
set statusline+=%1*\ ‹‹
set statusline+=%1*\ %f\ %*
set statusline+=%1*\ ››
set statusline+=%1*\ %m
set statusline+=%3*\ %F
set statusline+=%=
set statusline+=%3*\ ‹‹
set statusline+=%3*\ %{strftime('%R',getftime(expand('%')))}
set statusline+=%3*\ ::
set statusline+=%3*\ %n
set statusline+=%3*\ ››\ %*
