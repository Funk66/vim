"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'mkarmona/colorsbox'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'digitaltoad/vim-pug', {'for': 'pug'}
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript'}
Plug 'othree/jspc.vim', {'for': 'javascript'}
Plug 'wellle/tmux-complete.vim'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
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
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = "✘"
let g:ale_sign_warning = "⚠"
let g:ale_sign_style_error = "》"
let g:ale_sign_style_warning = "〉"
let g:ale_lint_delay = 5000
let g:ale_linters = {'python': ['flake8', 'mypy'], 'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver']}
let g:ale_fixers = {'python': ['yapf'], 'javascript': ['prettier'], 'typescript': ['prettier'], 'html': ['tidy'], 'css': ['prettier']}

highlight ALEErrorSign ctermbg=237 ctermfg=red
highlight ALEWarningSign ctermbg=237 ctermfg=yellow

nnoremap <leader>f :ALEFix<cr>

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
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CSV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
aug CSV_Editing
    au!
    au BufRead,BufWritePost *.csv :%ArrangeColumn
    au BufWritePre *.csv :%UnArrangeColumn
aug end

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
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '__pycache__']

nnoremap ñ :cn<cr>
