" =============================================================================
" Daniel's Vim Configuration of wonder
" =============================================================================


" Remove old legacy bits of Vim.
set nocompatible


" vim-plug setup.
call plug#begin('~/.vim/plugged')

" [1] - Add support for Emmet: http://emmet.io
" [2] - Add support for EditorConfig: http://editorconfig.org
" [3] - Add additional highlighting and syntax for JavaScript.
" [4] - Add syntax checking on save.
" [5] - Resize the window to 80 characters when shifting focus.
Plug 'https://github.com/mattn/emmet-vim.git' " [1]
Plug 'https://github.com/editorconfig/editorconfig-vim.git' " [2]
Plug 'https://github.com/pangloss/vim-javascript.git' " [3]
Plug 'https://github.com/vim-syntastic/syntastic.git' " [4]
Plug 'https://github.com/justincampbell/vim-eighties.git' " [5]

" Finish vim-plug setup.
call plug#end()


" Recommended settings for Syntastic.
" https://github.com/vim-syntastic/syntastic#settings
"
" [1] - Enable lots of debugging for Syntastic.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
""let g:syntastic_debug = 3 " [1]


" Enable EditorConfig.
let g:EditorConfig_core_mode = 'external_command'


" Add an extra 40 characters of width to windows when changing.
let g:eighties_extra_width = 40


" Initial configuration.
" [1] - Allow for traversal of directories in menus like :tabe.
" [2] - Allow the 'Backspace' key to function as normal.
set wildmenu " [1]
set backspace=indent,eol,start " [2]
set encoding=utf-8


" Filetype settings.
" [1] - Automatically detect the filetype.
" [2] - Detect indentation settings based on the filetype.
filetype on " [1]
filetype plugin indent on " [2]


" Whitespace settings.
set list
set listchars=tab:→\ ,trail:·


" Tab settings.
set tabstop=2
set shiftwidth=2


" Word wrap settings.
set wrap
set textwidth=80


" Adjust the handling of textwidth and colorcolumns when writing a Git
" commit message. Set the textwidth to 72 and add a second column for the
" commit title (to 50 characters)
" https://csswizardry.com/2017/03/configuring-git-and-vim/
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn+=51


" Ruler settings.
set number
set colorcolumn=+1


" Syntax settings.
" [1] - Automatically set all Markdown extension variants to be read as
"       Markdown files.
syntax on
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown " [1]


" Readability settings.
" [1] - Highlight search terms.
" [2] - Add a shortcut to remove highlighting by pressing 'Space'.
set linebreak
set hlsearch " [1]
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " [2] 


" Search and replace shortcut for selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


" Enable the statusline and hide the default ruler.
set laststatus=2
set noruler


" Enable the zenburn Vim color scheme and 256 color mode.
" https://github.com/jnurmine/Zenburn
set t_Co=256
colors zenburn


" Status line settings.
" [1]  - Add error reporting for the Syntastic plugin.
" [2]  - Display the file name (and add a hyphen separator)
" [2]  - Display file encoding.
" [3]  - Add a flag if the file is a help file.
" [4]  - Add a flag if the file is modified.
" [5]  - Add a flag if the file is readonly.
" [6]  - Shift remaining statusline edits to the right of the window.
" [7]  - Display the filetype.
" [8]  - Show the current soft and hard cursor column.
" [9]  - Show the current cursor line and total lines.
" [10] - Show the percentage scrolled.
" [11] - Mark the column value of one tab.
" [12] - Make the status line slightly personalised with a colour.
"        Use the following as a colour guide:
"        http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
set statusline+=%#warningmsg#                   " [1]
set statusline+=%{SyntasticStatuslineFlag()}    " [1]
set statusline+=%*                              " [1]
set statusline+=%f\ -\                          " [2]
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " [2]
set statusline+=%h                              " [3]
set statusline+=%m                              " [4]
set statusline+=%r                              " [5]
set statusline+=%=                              " [6]
set statusline+=%y\                             " [7]
set statusline+=%c%V:                           " [8]
set statusline+=%l/%L                           " [9]
set statusline+=\ %P                            " [10]
set softtabstop=2                               " [11]
hi StatusLine ctermfg=168 ctermbg=231           " [12]
