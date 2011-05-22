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
colorscheme ir_black
set lines=95
set columns=80
set guifont=Menlo:h12
set vb
hi CursorLine   cterm=NONE guibg=DarkGray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
