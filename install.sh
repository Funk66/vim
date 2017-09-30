pip install --user --upgrade neovim flake8 jedi
npm install --global standard tern jspc
nvim +PlugInstall +qall
npm --prefix ~/.config/nvim/plugged/tern_for_vim/ install
