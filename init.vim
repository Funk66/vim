"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic', {'for': ['python', 'javascript', 'html']}
Plug 'scrooloose/nerdcommenter'
Plug 'mkarmona/colorsbox'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'digitaltoad/vim-pug', {'for': 'pug'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'editorconfig/editorconfig-vim'
Plug 'wakatime/vim-wakatime'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'kshenoy/vim-signature'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'wellle/tmux-complete.vim'
Plug 'fszymanski/deoplete-emoji'
Plug 'leafgarland/typescript-vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on

let mapleader=","
set foldmethod=indent
set foldlevelstart=99
set ruler
set ignorecase
set smartcase
set lazyredraw
set showmatch
set number
set noshowmode
set cursorline
set mouse=a
set history=50
set matchtime=2
set conceallevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set t_Co=256
set background=dark
colorscheme colorsbox-stnight
set fillchars=vert:│,fold:─
hi VertSplit ctermbg=NONE guibg=NONE
au BufNewFile,BufRead Jenkinsfile setf groovy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile
set hidden
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent

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
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '┤ ' . printf("%10s", lines_count . ' lines') . ' ├'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('▻' . repeat(' ', v:foldlevel) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✘"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "》"
let g:syntastic_style_warning_symbol = "〉"
let g:syntastic_html_checkers=['jshint']
let g:syntastic_python_checkers=['flake8', 'mypy']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers=['coffeelint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = '⎢'
let g:gitgutter_sign_modified = '⎢'
let g:gitgutter_sign_removed = '＿'
let g:gitgutter_sign_modified_removed = '⎣'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CSV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
aug CSV_Editing
    au!
    au BufRead,BufWritePost *.csv :%ArrangeColumn
    au BufWritePre *.csv :%UnArrangeColumn
aug end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OmniComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close help window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_sort = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF + ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <c-p> :FZF<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '__pycache__']
