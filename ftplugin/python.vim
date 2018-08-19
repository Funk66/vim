setlocal shiftwidth=4
setlocal tabstop=4
setlocal textwidth=79
setlocal colorcolumn=+1
syn match pythonBoolean "\(\W\|^\)\zsself\ze"
nnoremap <leader>D Oimport ipdb; ipdb.set_trace()<Esc>
