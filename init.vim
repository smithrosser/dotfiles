call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'clangd/coc-clangd'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'dracula/vim'
	Plug 'itchyny/lightline.vim'
call plug#end()

set number
set cursorline
set shiftwidth=3
set tabstop=3

set termguicolors
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" NERDTree remaps
nnoremap <C-n> :NERDTreeFocus<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

let g:lightline = { 'colorscheme': 'one', }
