"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic', {'for': ['python', 'javascript', 'html']}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim' ", {'for': ['html', 'ejs', 'handlebars', 'php']}
Plug 'mkarmona/colorsbox'
Plug 'chrisbra/csv.vim', {'for': ['csv']}
Plug 'digitaltoad/vim-pug', {'for': ['pug']}
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript', {'for': ['js']}
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'leafgarland/typescript-vim'
"Plug 'Valloric/YouCompleteMe'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
let mapleader=","
" set foldmethod=indent

set history=50

runtime macros/matchit.vim

filetype plugin on
filetype indent on

set autoread

set ruler
set backspace=eol,start,indent

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw  " Don't redraw while executing macros (good performance config)

set showmatch  " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nu  " Set Relative numbering

set laststatus=2
set noshowmode
set cursorline

" set t_Co=256
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set t_Co=256

set background=dark

colorscheme colorsbox-stnight

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

set ffs=unix,dos,mac " Use Unix as the standard file type

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set hidden
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " Use spaces instead of tabs
set smarttab

set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Restore last session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_html_checkers=['jshint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1  " Buffer bar
let g:airline#extensions#tabline#fnamemod = ':t'  " Show filename in buffer bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CSV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

aug CSV_Editing
    au!
    au BufRead,BufWritePost *.csv :%ArrangeColumn
    au BufWritePre *.csv :%UnArrangeColumn
aug end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
