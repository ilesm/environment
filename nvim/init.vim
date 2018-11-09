
" This is an awesome one: <https://github.com/sodiumjoe/dotfiles/blob/master/vimrc>
" <https://github.com/amix/vimrc/tree/master/vimrcs>

set autochdir
set hidden
set relativenumber

" This adds 'space' to the list of allowed characters for filenames so that I
" can use `gf` to jump to a filename like `[[Other File.md]]`.
set isfname+=32

" Set to auto read when a file is changed from the outside
set autoread

" send to system clipboard: https://coderwall.com/p/g-d8rg
set clipboard+=unnamed

" For regular expressions turn magic on
set magic

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

augroup notes
    au!
    au CursorHold,CursorHoldI,BufLeave *.md,*.rst silent update
    au BufEnter,BufNew *.md,*.rst setlocal autoread 
augroup END

augroup wiki
    au!
    au CursorHold,CursorHoldI,BufLeave *.wiki silent update
    au BufEnter,BufNew *.wiki setlocal autoread 
augroup END

nnoremap <Leader>1 :e ~/Dropbox-secure/nv/TODO.md<CR>
nnoremap <Leader>2 :e ~/Dropbox-secure/nv/Archive\ 2018-10.md<CR>
nnoremap <Leader>m :silent !/Applications/Marked.app/Contents/Resources/mark "%"<CR>
nnoremap <Leader>c :e ~/.config/nvim/init.vim<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easier to remember window splits
map <C-w>" <C-W>v
map <C-w>= <C-W>s

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


call plug#begin('~/.config/nvim/plugins')
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/LeaderF'
Plug 'gabrielelana/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

