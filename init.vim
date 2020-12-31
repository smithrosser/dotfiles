call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'clangd/coc-clangd'
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
nnoremap <C-n> :NERDTree<CR>

let g:lightline = { 'colorscheme': 'one', }
