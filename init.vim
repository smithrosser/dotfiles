set nocompatible

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'clangd/coc-clangd'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'dracula/vim'
	Plug 'itchyny/lightline.vim'
call plug#end()

set number
set cursorline
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a
set guifont=Office\ Code\ Pro

set termguicolors
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" NERDTree remaps
nnoremap <C-n> :NERDTreeFocus<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:lightline = { 'colorscheme': 'one', }
