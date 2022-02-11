"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Jeffrey Wu
"
" Sections:
"    -> General
"    -> UI
"    -> Colors and Fonts
"    -> Tab and indent
"    -> Key bindings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config command-lines history
set history=500

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Load matchit plugin to make '%' command work better
if has('syntax') && has('eval')
  packadd! matchit
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show cursor line
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" Popup menu
highlight Pmenu ctermbg=grey guibg=#252526
highlight PmenuSel ctermbg=grey guibg=#017BCD

" Show line number and relative line number
set nu
set rnu

" Always show current position(row, column)
set ruler

" Config scroll off
set scrolloff=8

" Show wildmenu
set wildmenu

" Config search
set hlsearch
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax
if has("syntax")
  syntax on
endif

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Config color
colorscheme ron
set background=dark

" Config encoding
set encoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces  
set shiftwidth=4
set tabstop=4

" Config indent
set autoindent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <Space> as the leader key 
let mapleader=" "

" Make C-c works like <ESC> and <C-[>
inoremap <C-c> <C-[>

" Clean highlight search
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Command-lines shortcut
nnoremap <space><space> :

" Moving in insert mode which learn from Emacs
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-d> <DEL>

" Interact with system clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p
