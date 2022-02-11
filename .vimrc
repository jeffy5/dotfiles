"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Jeffrey Wu
"
" Sections:
"    -> basic.vim
"    -> filetypes.vim
"    -> plugins.vim
"    -> custom.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/basic.vim
source ~/.vim/plugins.vim

if filereadable("~/.vim/custom.vim")
  source ~/.vim/custom.vim
endif
