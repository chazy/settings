syntax on
filetype plugin on 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
nnoremap <silent> <F3> :Rgrep -I --exclude=*tags<CR><CR><CR><CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
set hidden
set hlsearch
set incsearch
set ts=8
set shiftwidth=8
set cindent
set autoindent

"Code folding
set foldmethod=marker   "fold based on indent
set foldmarker={,}      "folder markers
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

