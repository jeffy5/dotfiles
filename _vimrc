source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8

" ��������
color evening
set guifont=Consolas:h12
set nu
set rnu
set smartcase
set smartindent
set noundofile
set nobackup
set noundofile
set guioptions-=T
set guioptions-=m
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set nocompatible
set wildmenu
set hlsearch
set autoindent
set ruler

" set python support
set pythonthreedll=D:\software\python\python37.dll

" iabbrev
iabbrev ff fsociety
iabbrev @@ 876531737@qq.com
iabbrev gh github.com
iabbrev gw github.com/wjh876531738

" Disable the leader key in insert mode, or there will be a second pause when you
" press leader key. Use `verbose imap <leader>` to check whick key bind in the
" insert mode with leader key, just ban it.
let mapleader=" "

" ������ȥ������
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <C-c> <C-[>

" Emacs �ı�������ϰ�ߣ�insert ģʽ�µĶ̾�����ת
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-d> <DEL>
 
" Leader �İ�����
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" ctags config, code jump
nnoremap <leader>t <C-]>
nnoremap <leader>T g]
nnoremap <leader>vt :vsp<Enter><C-]>
nnoremap <leader>vT :vsp<Enter>g]

" Auto cmd group
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.rb set tabstop=2 softtabstop=2 shiftwidth=2 
    autocmd BufNewFile,BufRead *.html,*.css,*.scss syntax sync fromstart 
augroup END

augroup filetype_vue
    autocmd!
    autocmd BufNewFile,BufRead *.vue,*.wpy set filetype=vue 
    autocmd BufNewFile,BufRead *.vue,*.wpy syntax sync fromstart
    autocmd BufNewFile,BufRead *.vue,*.wpy set tabstop=2 softtabstop=2 shiftwidth=2 
augroup END

augroup filetype_python
    autocmd!
    autocmd BufNewFile,BufRead *.py nnoremap <leader>r :w<Enter>:!python3 %<CR>
    autocmd BufNewFile,BufRead *.py set tags+=/usr/local/lib/python3.5/dist-packages/tags
augroup END

augroup filetype_ruby
    autocmd!
    autocmd BufNewFile,BufRead *.rb nnoremap <leader>r :w<Enter>:!ruby %<CR>
    autocmd BufNewFile,BufRead *.rb set tags+=/home/wjh/.rvm/gems/ruby-2.3.0/gems/tags
augroup END

augroup filetype_go
    autocmd!
    autocmd BufNewFile,BufRead *.go nnoremap <leader>r :w<Enter>:!go run %<CR>
    autocmd BufNewFile,BufRead *.go set tags+=$GOLIB/src/tags
    autocmd BufWritePre,FileWritePre *.go GoImports
augroup END

augroup filetype_javscript
    autocmd!
    autocmd BufNewFile,BufRead *.js nmap <leader>r :w<Enter>:!node %<CR>
augroup END

" �������
filetype off  
" �˴��涨Vundle��·��  
set rtp+=$VIM/vimfiles/bundle/vundle/  
call vundle#rc('$VIM/vimfiles/bundle/')  
Bundle 'gmarik/vundle'  
filetype plugin indent on
" Below here to add the vundle what I want

" Emmet html��ǩ��������
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode = 'i'
" let g:user_emmet_expandabbr_key = '<C-y><TAB>'
imap <expr> <C-l> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_next_key = '<C-d>'
let g:user_emmet_prev_key = '<C-t>'
let g:user_emmet_install_global = 1

" NERDTreeĿ¼�����
Plugin 'scrooloose/nerdtree'
nnoremap <F4> :NERDTree<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=20
let g:NERDTreeShowLineNumbers=1

" NERDCommenter����ע�Ͳ��
Plugin 'scrooloose/nerdcommenter'

" ����������
" Plugin 'vim-scripts/taglist.vim'

" ������ӷ���
Plugin 'tpope/vim-surround'
" ʹsurround���ظ�
Plugin 'tpope/vim-repeat'

" ���й��
Plugin 'terryma/vim-multiple-cursors'

" Rails
Plugin 'tpope/vim-rails'

" �������
Plugin 'godlygeek/tabular'

" YouCompleteMe��ȫ
Plugin 'Valloric/YouCompleteMe'

" YouCompleteMe��ȫ����
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'
" �޸�ycm����
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" ���ó���һ��IDE
set completeopt=longest,menu
" �˳�insertģʽ���Զ����ز�ȫ��ʾ��
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" �س���ѡ��ȫ��
inoremap <expr> <CR>  pumvisible() ? "\<C-y>\<C-o>:pclose\<CR>\<C-o>l" : "\<CR>"
" ���ò�ȫ
" nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
" ע�ͺ��ַ����е�����Ҳ�ᱻ���벹ȫ
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_python_binary_path = 'D:\software\python\python.exe'

" �������ļ�
Plugin 'danro/rename.vim'

" Ctrlp �ļ�ģ������
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/dist/*

" �������� <Leader>ig �����л�����״̬
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" Vue
Plugin 'posva/vim-vue'
" ʶ��vue�ļ����и���

" ȫ������
Plugin 'dyng/ctrlsf.vim' 

" ������ת
Plugin 'Lokaltog/vim-easymotion'
nmap <Leader>jj <Plug>(easymotion-j)
nmap <Leader>jk <Plug>(easymotion-k)
nmap <Leader>jh <Plug>(easymotion-linebackward)
nmap <Leader>jl <Plug>(easymotion-lineforward)
nmap <Leader>jw <Plug>(easymotion-bd-w)

" ������Զ���ȫ
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" �Զ���ȫ����, ����
Plugin 'jiangmiao/auto-pairs'

" JS��ȫ
Plugin 'marijnh/tern_for_vim'

" Tagbar
Plugin 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<CR>

" Powerline
Plugin 'Lokaltog/vim-powerline'
set laststatus=2

" Mkdir the dependency directories when you create a file
Plugin 'pbrisbin/vim-mkdir'

" Ack.vim, Global search
Plugin 'mileszs/ack.vim'
"<Leader>s����������ͬʱ���Զ��򿪵�һ��ƥ����ļ�"
nnoremap <Leader>s :Ack!<Space>
"����ag��������
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"���������ؼ���
let g:ackhighlight = 0
"�޸Ŀ���Ԥ�����ڸ߶�Ϊ15
let g:ack_qhandler = "botright copen 15"
"��QuickFix����ʹ�ÿ�ݼ��Ժ��Զ��ر�QuickFix����
let g:ack_autoclose = 1
"ʹ��ack�Ŀհ���������������κβ���ʱ�Թ���µĵ��ʽ���������Ĭ��ֵΪ1����ʾ��������0�Ժ�ʹ�ÿհ����������ش�����Ϣ
let g:ack_use_cword_for_empty_search = 1
"���ֹ������ޣ������ڴ���Ŀ�����ٶȽ���ʱ���Գ��Կ���
"let g:ack_use_dispatch = 1

" ���ٶ���
Plugin 'junegunn/vim-easy-align'
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" git diff check
Plugin 'airblade/vim-gitgutter'

Plugin 'jceb/vim-orgmode'
augroup filetype_org
    autocmd!
    autocmd BufNewFile,BufRead *.org set filetype=org
augroup END

Plugin 'tpope/vim-speeddating'

"Plugin 'python-mode/python-mode'
"let g:pymode_python = 'python3'

" �﷨���
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" jsx
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0    " Allow JSX in normal JS files

" the plugin for go
Plugin 'fatih/vim-go'
