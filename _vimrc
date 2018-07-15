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
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

" 基本配置
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

" 清屏并去掉高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <C-c> <C-[>

" Emacs 的便利按键习惯，insert 模式下的短距离跳转
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-d> <DEL>
 
" Leader 的按键绑定
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

" 插件配置
filetype off  
" 此处规定Vundle的路径  
set rtp+=$VIM/vimfiles/bundle/vundle/  
call vundle#rc('$VIM/vimfiles/bundle/')  
Bundle 'gmarik/vundle'  
filetype plugin indent on
" Below here to add the vundle what I want

" Emmet html标签快速生成
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode = 'i'
" let g:user_emmet_expandabbr_key = '<C-y><TAB>'
imap <expr> <C-l> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_next_key = '<C-d>'
let g:user_emmet_prev_key = '<C-t>'
let g:user_emmet_install_global = 1

" NERDTree目录树插件
Plugin 'scrooloose/nerdtree'
nnoremap <F4> :NERDTree<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=20
let g:NERDTreeShowLineNumbers=1

" NERDCommenter快速注释插件
Plugin 'scrooloose/nerdcommenter'

" 变量函数树
" Plugin 'vim-scripts/taglist.vim'

" 快速添加符号
Plugin 'tpope/vim-surround'
" 使surround可重复
Plugin 'tpope/vim-repeat'

" 多行光标
Plugin 'terryma/vim-multiple-cursors'

" Rails
Plugin 'tpope/vim-rails'

" 代码对齐
Plugin 'godlygeek/tabular'

" YouCompleteMe补全
Plugin 'Valloric/YouCompleteMe'

" YouCompleteMe补全配置
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'
" 修改ycm按键
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 配置成像一样IDE
set completeopt=longest,menu
" 退出insert模式后自动隐藏补全提示框
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车键选择补全项
inoremap <expr> <CR>  pumvisible() ? "\<C-y>\<C-o>:pclose\<CR>\<C-o>l" : "\<CR>"
" 禁用补全
" nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_python_binary_path = 'D:\software\python\python.exe'

" 重命名文件
Plugin 'danro/rename.vim'

" Ctrlp 文件模糊查找
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/dist/*

" 缩进管理 <Leader>ig 快速切换开启状态
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" Vue
Plugin 'posva/vim-vue'
" 识别vue文件进行高亮

" 全局搜索
Plugin 'dyng/ctrlsf.vim' 

" 快速跳转
Plugin 'Lokaltog/vim-easymotion'
nmap <Leader>jj <Plug>(easymotion-j)
nmap <Leader>jk <Plug>(easymotion-k)
nmap <Leader>jh <Plug>(easymotion-linebackward)
nmap <Leader>jl <Plug>(easymotion-lineforward)
nmap <Leader>jw <Plug>(easymotion-bd-w)

" 代码块自动补全
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" 自动补全括号, 引号
Plugin 'jiangmiao/auto-pairs'

" JS补全
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
"<Leader>s进行搜索，同时不自动打开第一个匹配的文件"
nnoremap <Leader>s :Ack!<Space>
"调用ag进行搜索
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"高亮搜索关键词
let g:ackhighlight = 0
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
"部分功能受限，但对于大项目搜索速度较慢时可以尝试开启
"let g:ack_use_dispatch = 1

" 快速对齐
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

" 语法检查
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
