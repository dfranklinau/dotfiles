" =============================================================================
" JSON syntax settings
" =============================================================================


" Reading
" =============================================================================

" Remove line numbers from Markdown since these documents focus on prose.
setlocal nonumber

" Set the spell check in Vim to English (UK). (Only available in Vim 7.)
setlocal spell spelllang=en_gb





" Editing
" =============================================================================

" [1] - Use two space indentation for easier readibility.
" [2] - Basic indentation enforcement, just in case.
setlocal expandtab " [1]
setlocal tabstop=2 " [1]
setlocal softtabstop=2 " [1]
setlocal shiftwidth=2 " [1]
setlocal autoindent " [2]

