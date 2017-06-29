" =============================================================================
" Daniel's Vim Configuration of wonder
" =============================================================================


" Remove old legacy bits of Vim.
set nocompatible


" vim-plug setup.
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" [1] - Add support for Emmet: http://emmet.io
" [2] - Add support for EditorConfig: http://editorconfig.org
" [3] - Add additional highlighting and syntax for JavaScript.
" [4] - Add syntax checking on save.
" [5] - Resize the window to 80 characters when shifting focus.
" [6] - Text filtering and alignment (required by [7]).
" [7] - Optimised syntax highlighting and rules for Markdown.
" [8] - Show inline Git diff changes.
Plug 'https://github.com/mattn/emmet-vim.git' " [1]
Plug 'https://github.com/editorconfig/editorconfig-vim.git' " [2]
Plug 'https://github.com/pangloss/vim-javascript.git' " [3]
Plug 'https://github.com/vim-syntastic/syntastic.git' " [4]
Plug 'https://github.com/justincampbell/vim-eighties.git' " [5]
Plug 'https://github.com/godlygeek/tabular.git' " [6]
Plug 'https://github.com/plasticboy/vim-markdown.git' " [7]
Plug 'https://github.com/airblade/vim-gitgutter.git' " [8]

" Finish vim-plug setup.
call plug#end()


" Custom settings for Syntastic. These settings will disable the location list
" that is typically used, but will still popluate errors.
"
" For more information, refer to the Syntastic settings:
" https://github.com/vim-syntastic/syntastic#settings
"
" [1] - Enable lots of debugging for Syntastic.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_debug = 3 " [1]


" Vim Markdown configuration
" https://github.com/plasticboy/vim-markdown#options
"
" [1] - Fold all headings except h1 on file load.
" [2] - Automatically indents new list items by 2 spaces (in my case, 1 tab).
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_new_list_item_indent = 2 " [2]


" Enable EditorConfig.
let g:EditorConfig_core_mode = 'external_command'


" Initial configuration.
" [1] - Allow for traversal of directories in menus like :tabe.
" [2] - Allow the 'Backspace' key to function as normal.
" [3] - Set the minimum number of lines to appear above and below the cursor,
"       where `so` stands for `scrolloff`.
set wildmenu " [1]
set backspace=indent,eol,start " [2]
set encoding=utf-8
set so=7


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
" [3]  - Display file encoding.
" [4]  - Add a flag if the file is a help file.
" [5]  - Add a flag if the file is modified.
" [6]  - Add a flag if the file is readonly.
" [7]  - Shift remaining statusline edits to the right of the window.
" [8]  - Display the current date and time.
" [9]  - Display the filetype.
" [10]  - Show the current soft and hard cursor column.
" [11]  - Show the current cursor line and total lines.
" [12] - Show the percentage scrolled.
" [13] - Mark the column value of one tab.
" [14] - Make the status line slightly personalised with a colour.
"        Use the following as a colour guide:
"        http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
set statusline=%#warningmsg#                               " [1]
set statusline+=%{SyntasticStatuslineFlag()}               " [1]
set statusline+=%*                                         " [1]
set statusline+=%f\ -\                                     " [2]
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]            " [3]
set statusline+=%h                                         " [4]
set statusline+=%m                                         " [5]
set statusline+=%r                                         " [6]
set statusline+=%=                                         " [7]
set statusline+=%{strftime('%a\ %d/%m/%y\ %H:%M\ ')} " [8]
set statusline+=%y\                                        " [9]
set statusline+=%c%V:                                      " [10]
set statusline+=%l/%L                                      " [11]
set statusline+=\ %P                                       " [12]
set softtabstop=2                                          " [13]
hi StatusLine ctermfg=168 ctermbg=231                      " [14]
