"  _   _                 _            
" | \ | | ___  _____   _(_)_ __ ___   
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  
" | |\  |  __/ (_) \ V /| | | | | | | 
" |_| \_|\___|\___/ \_/ |_|_| |_| |_| 
"                                     
" by Stephan Raabe, modified by Luke Le (2023)
" ----------------------------------------------------- 

filetype plugin indent on   "allow auto-indenting depending on file type

" esc in insert & visual mode
inoremap kj <esc>
vnoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" exiting which is Ctrl-C

set autoindent              " indent a new line the same amount as the line just typed
" set backupdir=~/.cache/vim " Directory to store backup files.
" set cc=80                   " set an 80 column border for good coding style
set clipboard=unnamedplus   " using system clipboard
" set spell                 " enable spell check (may need to download language package)
set cursorline              " highlight current cursorline
set expandtab               " converts tabs to white space
set hlsearch                " highlight search 
set ignorecase              " case insensitive 
set incsearch               " incremental search
" set mouse=a                 " enable mouse click
" set mouse=v                 " middle-click paste with 
set nocompatible            " disable compatibility to old-time vi
" set noswapfile            " disable creating swap file
set number                  " add line numbers
set rnu                     " relative number lines
set shiftwidth=2            " width for autoindents
set showmatch               " show matching 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set tabstop=2               " number of columns occupied by a tab 
set timeoutlen=500          " shorten delay for when typing 'k'
set ttyfast                 " Speed up scrolling in Vim
set undofile                " persistent history for undo
set wildmode=longest,list   " get bash-like tab completions
syntax on                   " syntax highlighting
filetype plugin on
