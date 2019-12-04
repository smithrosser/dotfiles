" Load plugins using vim-plug
call plug#begin('~/.config/nvim/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'junegunn/vim-easy-align'
	Plug 'jiangmiao/auto-pairs'
call plug#end()

" Open NERDTree on startup (then switch focus to document)
autocmd vimenter * NERDTree
autocmd vimenter * wincmd w

" Basic vim prefs
set relativenumber
set cursorline
set numberwidth=5

" Gruvbox theme prefs
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_termcolors = '256'
let g:gruvbox_contrast_dark = 'soft'
colo gruvbox

" Some nice keymaps
map :nt<CR> :NERDTreeToggle<CR>
" map :wq<CR> :wqa <CR>

" Custom statusline (stolen from kadekillary.work)
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
