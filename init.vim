call plug#begin()
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Files
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Common
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'wellle/tmux-complete.vim'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

" JS
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript'}
Plug 'othree/jspc.vim', {'for': 'javascript'}
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'digitaltoad/vim-pug', {'for': 'pug'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

"Python
Plug 'numirias/semshi', {'for': 'python', 'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}

" Others
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'towolf/vim-helm'
Plug 'skreuzer/vim-prometheus'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'vimwiki/vimwiki'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'mkarmona/colorsbox'
Plug 'ryanoasis/vim-devicons'
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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set t_Co=256
set background=dark
colorscheme colorsbox-stnight
set fillchars=vert:│,fold:─
hi VertSplit ctermbg=NONE guibg=NONE
au BufNewFile,BufRead Jenkinsfile setf groovy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=/tmp
set directory=/tmp
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
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow switching window without pressing <c-w>
nno <c-j> <c-w>j
nno <c-k> <c-w>k
nno <c-h> <c-w>h
nno <c-l> <c-w>l

" Exit terminal
tnoremap <Esc><Esc> <C-\><C-n>

noremap <PageDown> <Nop>
noremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>

nnoremap ñ :cn<cr>
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
nnoremap gr :Ggr <cword> *<CR>
nnoremap gR :Ggr '\b<cword>\b' *<CR>
nno <leader>F :Ggr '<c-r>0'<cr>
nno <leader>bb :Gblame<cr>

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
let g:ale_linters = {'python': ['flake8', 'mypy'], 'javascript': ['eslint'], 'javascriptreact': ['eslint'], 'typescriptreact': ['eslint'], 'typescript': ['tslint', 'tsserver'], 'terraform': ['terraform', 'tflint'], 'css': ['stylelint']}
let g:ale_fixers = {'python': ['black'], 'javascript': ['eslint'], 'javascriptreact': ['eslint'], 'typescriptreact': ['eslint'], 'typescript': ['prettier'], 'html': ['prettier'], 'css': ['prettier'], 'json': ['jq'], 'terraform': ['terraform'], 'yaml': ['prettier']}

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
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_sort = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF + ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <c-p> :FZF<cr>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
set completeopt-=preview
call deoplete#initialize()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '__pycache__', 'node_modules']
nnoremap <leader>tv :NERDTreeVCS<cr>
nnoremap <leader>tt :NERDTreeToggle<cr>
nnoremap <leader>tf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_list = [{'path': '~/.config/vimwiki/'}]
