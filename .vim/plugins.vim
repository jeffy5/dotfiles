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
"     - dart-vim-plugin
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
" dart-vim-plugin
"   Syntax highlighting for Dart in Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dart-lang/dart-vim-plugin'
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
"   coc nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show document
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Go to definition
nnoremap <leader>vt :vsp<Enter>:call CocAction("jumpDefinition")<Enter>

" Diagnostic move
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

call plug#end()
