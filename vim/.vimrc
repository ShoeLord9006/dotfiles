syntax on
filetype on
filetype plugin indent on
set modeline

set foldmethod=marker

set showcmd
"set noshowmode
set number
colo koehler
"COLOUR OVERRIDES FOR SUPERTAB
hi Pmenu term=NONE ctermbg=178 ctermfg=0
hi PmenuSel term=None ctermbg=100 ctermfg=0
"COLOUR OVERRIDES FOR TABLINE
"hi TabLine ctermfg=Green ctermbg=DarkGrey
"hi TabLineSel ctermfg=Green ctermbg=Grey
"hi TabLineFill ctermfg=Green ctermbg=DarkGrey

"AIRLINE SETTINGS
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#buffer_min_count = 2

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set cursorline
set mouse=nv
if has('clipboard')
    set clipboard=unnamedplus
endif

hi LineNr ctermbg=234
hi CursorLine ctermbg=238
hi CursorLineNr ctermbg=238
hi Visual ctermbg=White ctermfg=DarkGrey
hi HighlightedyankRegion ctermbg=166 ctermfg=White
let g:highlightedyank_highlight_duration=500

"ADD CREATOR
let @p='iCreator: Blake Lamond, 20183606'
"LOAD SUPERTAB
"let @t=':packadd supertab'
nnoremap <F12> :packadd supertab:echo "Enabled Supertab"

"VIM-AIRLINE STUFF
set ttimeoutlen=50


"ULTIMATE MACROS
ab sout System.out.println("");
"Create blank java file
let @j='i/*FILE: =expand("%:t")AUTHOR: Blake Lamond (20183606)PURPOSE:*/import java.util.*;public class =expand("%:r"){public static void main(String[] args){}}13ggS'
"Reload vimrc
nnoremap <F2> :source ~/.vimrc
"Insert date/time
nnoremap <F5> "=strftime("%c")P
inoremap <F5> =strftime("%c")
"Save and compile java
nnoremap <F9> :w:!javac *.java
nnoremap <F11> :tab term

tnoremap  N
tnoremap <C-PageUp> gT
tnoremap <C-PageDown> gt

vnoremap > >gv
vnoremap < <gv

let @i='gg=G'

nnoremap <F1> :call ListStuff()
function! ListStuff()
    echo "Compiled with +clipboard: ".has('clipboard')
    echo "Macros:"
    echo "@i          - Autoindents ENTIRE file"
    echo "@j          - Create virgin .java file"
    echo ""
    echo "Keybinds - Function Keys"
    echo "F1  - N     - This Menu"
    echo "F2  - N     - Reload ~/.vimrc"
    echo "F4  - NI    - Open/Close a Fold"
    echo "F5  - NI    - Write DateTime into buffer"
    echo "F9  - N     - Save and compile currently open *.java file"
    echo "F10 - N     - Opens new empty tab, with CtrlP"
    echo "F11 - N     - Opens terminal in new tab"
    echo "F12 - N     - Enable supertab plugin"
    echo ""
    echo "Keybinds - KeyCombos"
    echo "Ctrl+N - N  - Opens new empty tab, with CtrlP"
endfunction

function! Tapi_OpenFile(bufnum,arglist)
    echo "Opening File: ".a:arglist[0]
    execute "tab drop" a:arglist[0]
endfunction

"au BufAdd,BufNewFile * nested tab sball
"au BufAdd * nested tab sball

cmap w!! w !sudo tee > /dev/null %

set backspace=indent,eol,start

function! Boop()
    tabnew
    CtrlP
endfunction

nnoremap  :call Boop()
nnoremap <F10> :call Boop()

set colorcolumn=81,161
hi ColorColumn ctermbg=0

let g:airline#extensions#whitespace#enabled = 0

"nnoremap <F8> :set list!
set list
set listchars=trail:~ ",eol:$

inoremap <F8> <Esc>pa

nnoremap <F4> za
inoremap <F4> <C-O>za
