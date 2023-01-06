
" This is an awesome one: <https://github.com/sodiumjoe/dotfiles/blob/master/vimrc>
" <https://github.com/amix/vimrc/tree/master/vimrcs>


" -----------------------------------------------------------------------------
"  Editor, formatting, other basic settings

" set autochdir
set hidden
set number
set relativenumber

" This adds 'space' to the list of allowed characters for filenames so that I
" can use `gf` to jump to a filename like `[[Other File.md]]`.
set isfname+=32

" Set to auto read when a file is changed from the outside
set autoread

" Send to system clipboard <https://coderwall.com/p/g-d8rg>
set clipboard+=unnamed

" For regular expressions turn magic on
set magic

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab 
set shiftwidth=4
set tabstop=4

set ignorecase
set smartcase

set nowrap
set nospell

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


set undodir=~/.config/nvim-undo
set backupdir=~/.config/nvim-backup
set directory=~/.config/nvim-swap

set nobackup
set nowritebackup
set noswapfile
set noundofile

set wildmenu
set wildmode=longest:full,full

" -----------------------------------------------------------------------------
"  Colour Scheme
"

silent! colorscheme gruvbox
set background=dark

" -----------------------------------------------------------------------------
"  My Stuff
"
augroup notes
    autocmd!
    autocmd CursorHold,CursorHoldI,BufLeave *.md,*.rst silent update
    autocmd BufEnter,BufNew *.md,*.rst setlocal autoread 
    autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
augroup END

augroup wiki
    autocmd!
    autocmd CursorHold,CursorHoldI,BufLeave *.wiki silent update
    autocmd BufEnter,BufNew *.wiki setlocal autoread 
augroup END

autocmd BufEnter * silent! lcd %:p:h

nnoremap <Leader>1 :e ~/Dropbox-secure/nv/TODO.md<CR>
nnoremap <Leader>2 :e ~/Dropbox-secure/nv/Archive\ 2022-12.md<CR>
nnoremap <Leader>m :silent !/Applications/Marked.app/Contents/Resources/mark "%"<CR>
nnoremap <Leader>c :e ~/.config/nvim/init.vim<CR>

nnoremap <Leader>e :e %:p:h<CR>

nnoremap <Esc> :let @/ = ""<CR>

autocmd FileType netrw setl bufhidden=delete

" -----------------------------------------------------------------------------
"  Windows, splits
"
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easier to remember window splits
map <C-w>" <C-W>v
map <C-w>= <C-W>s


" -----------------------------------------------------------------------------
"  Airline
"
" Show buffer list in Airline
" let g:airline#extensions#tabline#enabled = 1


" -----------------------------------------------------------------------------
"  Terraform
"
let g:terraform_align=1


" -----------------------------------------------------------------------------
"  Markdown
"
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_leader_mappings = 0


" -----------------------------------------------------------------------------
"  CtrlP
"
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_root_markers = ['.ctrlp_root']

"let g:ctrlp_working_path_mode = 0


" -----------------------------------------------------------------------------
"  Silver Searcher
"
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" -----------------------------------------------------------------------------
"  Plugins

call plug#begin('~/.config/nvim-plugins')
" Plug 'Yggdroot/LeaderF'
" Plug 'ilesm/vim-markdown'
" Plug 'itchyny/lightline.vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'saltstack/salt-vim'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-vinegar'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'stephpy/vim-yaml'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

