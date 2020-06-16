setlocal shiftwidth=4
setlocal tabstop=4
setlocal textwidth=79
setlocal colorcolumn=+1
nnoremap <leader>D Obreakpoint()<Esc>

" Kialo
autocmd VimEnter,BufNewFile,BufRead /home/guillermo/Workspace/kialo/* set textwidth=119
"autocmd BufNewFile,BufRead let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint', 'tsserver'], 'typescript': ['tslint', 'tsserver']}
