" Solarized Dark 4 life
set background=dark
colorscheme Solarized
let g:solarized_termtrans=1

" Don't pretend to be vi
set nocompatible

" OS Keyboard setup
set clipboard=unnamed

" Command line completion
set wildmenu

" Cursor keys in insert mode
set esckeys

" Backspace in INS mode
set backspace=indent,eol,start`

" Fast terminal optimization
set ttyfast

" Global search and replace by default
set gdefault

" Use UTF-8 encoding, no BOM
set encoding=utf-8 nobomb

" Modify map leader key
let mapleader=","

" Set backup directories
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  setundodir=~/.vim/undo
endif

" Halt backups in certain directories
set backupskip=/tmp/*,~/.private

" Modelines
set modeline
set modelines=4

" Allow per-directory .vimrc files but locked down
set exrc
set secure

" Line numbers
set number
syntax on

" Highlight current line
set cursorline

" 2 space tabs
set tabstop=2

" Search config
set hlsearch
set ignorecase
set incsearch

" ALways renderstatus line
set laststatus=2

" Permit mouse usage
set mouse=a

" No error audio bells
set noerrorbells

" Avoid reset of cursor position when moving lines
set nostartofline

" Show cursor position
set ruler

" No intro message
set shortmess=atI

" Display current mode
set showmode

" Display filename in titlebar
set title

" Show partial commands as they are typed out
set showcmd

" Scroll 3 lines beforehorizontal window border
set scrolloff=3

filetype plugin indent on


" Strip whitespace
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query =getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Save file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  filetype on
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
