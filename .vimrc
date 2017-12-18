" =============================================================================
" Daniel's Vim Configuration of wonder
" =============================================================================


" Remove old legacy bits of Vim.
set nocompatible





" Plugins
" =============================================================================

" Enable EditorConfig.
let g:EditorConfig_core_mode = 'external_command'





" Reading
" =============================================================================

" Readability settings.
" [1] - Automatiicaly break lines by words, not by character.
" [2] - Highlight search terms. (see 'Key remapping' for shortcut to toggle
"       search term highlighting.)
set linebreak
set hlsearch " [2]


" Syntax settings.
" [1] - Automatically set all Markdown extension variants to be read as
"       Markdown files.
syntax on
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown " [1]





" Editing
" =============================================================================

" [1] - Allow for traversal of directories in menus like `:tabe`.
" [2] - Allow the 'Backspace' key to function as normal.
" [3] - Set the minimum number of lines to appear above and below the cursor,
"       where `so` stands for `scrolloff`.
set wildmenu " [1]
set backspace=indent,eol,start " [2]
set encoding=utf-8
set so=7 " [3]


" Filetype settings.
" [1] - Automatically detect the filetype.
" [2] - Detect indentation settings based on the filetype.
filetype on " [1]
filetype plugin indent on " [2]


" Whitespace settings.
set list
set listchars=tab:␣\ ,trail:·


" Tab settings.
" [1] - Use two space indentation for easier readibility.
" [2] - Basic indentation enforcement, just in case.
setlocal expandtab " [1]
setlocal tabstop=2 " [1]
setlocal softtabstop=2 " [1]
setlocal shiftwidth=2 " [1]
setlocal autoindent " [2]


" Word wrap settings.
set wrap
set textwidth=80


" Ruler settings.
set number
set colorcolumn=+1





" Git
" =============================================================================

" Adjust the handling of textwidth and colorcolumns when writing a Git
" commit message. Set the textwidth to 72 and add a second column for the
" commit title (to 50 characters)
" https://csswizardry.com/2017/03/configuring-git-and-vim/
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn+=51





" Key remapping
" =============================================================================

" [C-r] - Search and replace shortcut for selected text
" [Space] - Add a shortcut to remove highlighting by pressing 'Space'.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>





" Themes
" =============================================================================

" Enable the zenburn Vim color scheme and 256 color mode.
" https://github.com/jnurmine/Zenburn
set t_Co=256
colors zenburn





" Status line
" =============================================================================

" Enable the statusline and hide the default ruler.
set laststatus=2
set noruler

" [1]  - Display the file name (and add a hyphen separator)
" [2]  - Display file encoding.
" [3]  - Add a flag if the file is a help file.
" [4]  - Add a flag if the file is modified.
" [5]  - Add a flag if the file is readonly.
" [6]  - Shift remaining statusline edits to the right of the window.
" [7]  - Display the filetype.
" [8] - Show the current soft and hard cursor column.
" [9] - Show the current cursor line and total lines.
" [10] - Show the percentage scrolled.
" [11] - Mark the column value of one tab.
" [12] - Make the status line slightly personalised with a colour.
"        Use the following as a colour guide:
"        http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
set statusline+=%f\ -\                                     " [1]
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
hi StatusLine ctermfg=168 ctermbg=231                      " [12]
