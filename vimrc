"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic', {'for': ['javascript', 'html']}
Plug 'scrooloose/nerdcommenter'
Plug 'mkarmona/colorsbox'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'python-mode/python-mode'
Plug 'chrisbra/csv.vim', {'for': ['csv']}
Plug 'digitaltoad/vim-pug', {'for': ['pug']}
Plug 'pangloss/vim-javascript', {'for': ['js']}
Plug 'leafgarland/typescript-vim', {'for': ['ts']}
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
set foldmethod=indent
set foldlevelstart=99
autocmd FileType python setlocal foldmethod=expr

runtime macros/matchit.vim

filetype plugin on
filetype indent on

set ruler

" Searching
set ignorecase
set smartcase

set lazyredraw  " Don't redraw while executing macros (good performance config)
set showmatch  " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

set tm=500

set nu
set noshowmode
set cursorline
set history=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set t_Co=256
set background=dark
colorscheme colorsbox-stnight
set ffs=unix,dos,mac " Use Unix as the standard file type

" Thin window decorators
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set hidden
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set lbr " Linebreak on 500 characters
set tw=500

set ai " Auto indent
set si " Smart indent

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
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OmniComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Close help window automatically
 autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'
