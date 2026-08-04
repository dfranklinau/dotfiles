" See: https://neovim.io/doc/user/provider/#provider-clipboard
set clipboard+=unnamedplus

" See: https://neovim.io/doc/user/nvim/#nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
