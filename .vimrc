" =============================================================================
" Daniel's Vim configuration of wonder
" =============================================================================


" Remove old legacy bits of Vim.
set nocompatible

" No more accidental mouse clicks moving my Vim cursor while typing.
set mouse=

" Prevent the `.vim/.netrwhist` file from being created, since I have no real
" need for it (yet).
let g:netrw_dirhistmax = 0





" Plugins
" =============================================================================

" Let ctrlp.vim search all files and define sensible ignores.
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage\|static\|*.tgz\|dist\|public\|lib\'





" Reading
" =============================================================================

" Readability settings.
" [1] - Automatically break lines by words, not by character.
" [2] - Highlight search terms. (see 'Key remapping' for shortcut to toggle
"       search term highlighting.)
set linebreak " [1]
set hlsearch " [2]


" Search settings.
" [1] - Ignore the case of searches by default.
" [2] - Combined with the setting of [1], all searches become case-insensitive
"       by default _unless_ there is an uppercase character.
" [3] - Turns on incremental search, which moves to the first match while
"       typing.
set ignorecase " [1]
set smartcase " [2]
set incsearch " [3]


" Set the spell check in Vim to English, Australia. Only available in Vim
" versions 7 or higher. To regenerate the spell file, run:
"
" ```
" mkspell! .vim/spell/en.utf-8.add
" ```
"
" [1] - Prevent URLs from being spell checked.
" [2] - Prevent inline code (between backticks) from being spell checked.
set spell spelllang=en_au
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell " [1]
syn match InlineCodeNoSpell '`.*[^`]`' contains=@NoSpell " [2]


" Syntax settings.
" [1] - Automatically set all Markdown extension variants to be read as
"       Markdown files.
syntax on
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown " [1]


" Fold settings.
" [1] - Use syntax highlighting to determine folds.
" [2] - Display fold information in a column.
set foldmethod=syntax " [1]
set foldcolumn=2 " [2]





" Editing
" =============================================================================

" [1] - Allow for traversal of directories in menus like `:tabe`.
" [2] - Allow the 'Backspace' key to function as normal.
" [3] - Set the minimum number of lines to appear above and below the cursor,
"       where `so` stands for `scrolloff`.
" [4] - Allow Vim to access the system clipboard.
set wildmenu " [1]
set backspace=indent,eol,start " [2]
set encoding=utf-8
set so=7 " [3]
set clipboard=unnamed " [4]


" Filetype settings.
" [1] - Automatically detect the filetype.
" [2] - Detect indentation settings based on the filetype.
filetype on " [1]
filetype plugin indent on " [2]


" Whitespace settings.
set list
set listchars=tab:␣\ ,trail:·


" Tab settings.
" [1] - Use two space indentation for easier readability.
" [2] - Basic indentation enforcement, just in case.
set expandtab " [1]
set tabstop=2 " [1]
set softtabstop=2 " [1]
set shiftwidth=2 " [1]
set autoindent " [2]


" Word wrap settings.
set wrap
set textwidth=80


" Ruler settings.
set number
set colorcolumn=+1





" netrw
" =============================================================================

" Disable the information banner in netrw.
let g:netrw_banner=0





" Git
" =============================================================================

" Adjust the handling of `textwidth` and `colorcolumns` when writing a Git
" commit message. Set the `textwidth` to 72 and add a second column for the
" commit title (to 50 characters)
" https://csswizardry.com/2017/03/configuring-git-and-vim/
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn+=51





" Key remapping
" =============================================================================

" nmap  - Remappings for Normal mode.
" vnmap - Remappings for Visual mode.
" cmap  - Remappings for Command-line mode.

" <C-r>   - Search and replace shortcut for selected text
" <C-k>   - Go the previous ALE error.
" <C-j>   - Go the next ALE error.
" <Space> - Add a shortcut to remove highlighting by pressing 'Space'.
" _v      - Vertically resize the window to 100.
" :w!!    - Writes a file opened without `sudo` via a hack so that Vim does not
"           have to be started with `sudo` permissions.
vmap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nmap <silent> _v :vert resize 100<CR>
cmap w!! w !sudo tee > /dev/null %

" The following remappings are based on the `unimpaired.vim` plugin:
" https://github.com/tpope/vim-unimpaired
"
" [ot - Set the local textwidth to 80.
" ]ot - Set the local textwidth to 0 (disabling automatic word wrapping).
" yot - Toggle the local textwidth between 80 and 0.
nmap <silent> [ot :setlocal textwidth=80<CR>
nmap <silent> ]ot :setlocal textwidth=0<CR>
nmap <silent> yot :setlocal textwidth=<C-R>=&textwidth == "80" ? "0" : "80"<CR><CR>





" Commands
" =============================================================================

" Wa  - Stops the classic typo from throwing an error by remapping it to the
"       intended `wa` command.
" Wq  - The same as above.
" Wqa - The same as above... again.
command! Wa wa
command! Wq wq
command! Wqa wqa





" Themes
" =============================================================================

" Set the colorscheme to "gruvbox" (installed as a plugin).
autocmd vimenter * ++nested colorscheme gruvbox

" Set the mode to dark.
set background=dark " Enable dark mode.

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux. If you're using
" tmux version 2.2 or later, you can remove the outermost $TMUX check and use
" tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif





" Status line
" =============================================================================

" Enable the `statusline` and hide the default ruler.
set laststatus=2
set noruler

" [1]  - Display the file name (and add a hyphen separator)
" [2]  - Display file encoding.
" [3]  - Add a flag if the file is a help file.
" [4]  - Add a flag if the file is modified.
" [5]  - Add a flag if the file is read only.
" [6]  - Shift remaining `statusline` edits to the right of the window.
" [7]  - Display the filetype.
" [8]  - Show the current soft and hard cursor column.
" [9]  - Show the current cursor line and total lines.
" [10] - Show the percentage scrolled.
" [11] - Mark the column value of one tab.
set statusline=%f\ -\                                      " [1]
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]            " [2]
set statusline+=%h                                         " [3]
set statusline+=%m                                         " [4]
set statusline+=%r                                         " [5]
set statusline+=%=                                         " [6]
set statusline+=%y\                                        " [7]
set statusline+=%c%V:                                      " [8]
set statusline+=%l/%L                                      " [9]
set statusline+=\ %P                                       " [10]
set softtabstop=2                                          " [11]
