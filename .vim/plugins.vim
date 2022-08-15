"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     Jeffrey Wu
"
" Sections:
"     - Install vim-plug
"     - NERDTree
"     - NERDCommenter
"     - Tagbar
"     - Ctrlp
"     - emmet-vim
"     - auto-pairs
"     - Ultisnips
"     - vim-snippets
"     - vim-easymotion
"     - vim-surround
"     - vim-repeat
"     - vim-easy-align
"     - vim-multiple-cursors
"     - vim-airline
"     - ack.vim
"     - vim-vue
"     - vim-javascript
"     - vim-go
"     - coc.nvim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"   Show file list on side
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
nnoremap <F4> :NERDTree<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
"   Comment with ease
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"   Show tag list on side
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/tagbar'
nnoremap <F8> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp
"   Fuzzy file finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<SPACE>f'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet-vim
"   Essential toolkit for expanding tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mattn/emmet-vim'
let g:user_emmet_mode = 'i'
imap <expr> <C-l> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_next_key = '<C-d>'
let g:user_emmet_prev_key = '<C-t>'
let g:user_emmet_install_global = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
"   Fuzzy file finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"   Snippet tools
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-snippets
"   A snippet sets for various programming languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'honza/vim-snippets'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion
"   Easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Lokaltog/vim-easymotion'
nmap <Leader>j <Plug>(easymotion-prefix)
nmap <Leader>jj <Plug>(easymotion-j)
nmap <Leader>jk <Plug>(easymotion-k)
nmap <Leader>jh <Plug>(easymotion-linebackward)
nmap <Leader>jl <Plug>(easymotion-lineforward)
nmap <Leader>jw <Plug>(easymotion-bd-w)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-surround
"   Surround words with ease
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-repeat
"   Make command '.' work for vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-repeat'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"   Words alignment with esae
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/vim-easy-align'
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"   Multiple selections
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'terryma/vim-multiple-cursors'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim.airline
"   Lean & mean status/tabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
"   Global search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mileszs/ack.vim'

" Map <leader>s as shortcut
nnoremap <leader>s :Ack!<Space>

" Use ag(the_silver_searcher)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-vue
"   vim vue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'posva/vim-vue'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-javascript
"   vim javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"   vim go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
"   coc nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Show document
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Import package
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Complete source
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Go to definition
nnoremap <leader>vt :vsp<Enter>:call CocAction("jumpDefinition")<Enter>

" Diagnostic move
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

call plug#end()
