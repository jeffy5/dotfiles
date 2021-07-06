runtime! debian.vim
if has("syntax")
  syntax on
endif

if has("python3")
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 设置编码
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

" 解决和tmux的颜色冲突问题
" colorscheme elflord

" 基本配置
set nu
set rnu
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set autoindent 
set hlsearch
set incsearch
set nocompatible
set wildmenu
set ruler
set cursorline
" set spell spelllang=en_us,cjk

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors
set background=dark
set term=xterm-256color

highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight Pmenu ctermbg=grey guibg=#252526
highlight PmenuSel ctermbg=grey guibg=#017BCD

" add （） to % match
set mps+=（:）

" iabbrev
iabbrev ff fsociety
iabbrev @@ 876531737@qq.com
iabbrev gh github.com
iabbrev gw github.com/wjh876531738
iabbrev dg ditigram

" 清屏并去掉高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" 一些基本的映射
nnoremap <F2> :!ici <C-R><C-W><CR>

" Disable the leader key in insert mode, or there will be a second pause when you
" press leader key. Use `verbose imap <leader>` to check which key bind in the
" insert mode with leader key, just ban it.
"
" Setting <Space> as leader key 
let mapleader=" "
inoremap <C-c> <C-[>

" " One handed coding
nnoremap <space><space> :
" nnoremap <C-e> <C-u>
" nnoremap <C-c> :w<CR>
" nnoremap <C-c><C-c> :wqa<CR>
" 
" imap <expr> <leader>tt emmet#expandAbbrIntelligent("\<tab>")
" inoremap <C-c> <C-[>
" inoremap <leader>ad +
" inoremap <leader>an &
" inoremap <leader>st *
" 
" inoremap <leader>u <C-[>gU<RIGHT>a
" inoremap <leader>uu <C-[>bgUwea
" 
" inoremap <leader>12 ()<LEFT>
" inoremap <leader>11 -
" inoremap <leader>22 =
" 
" inoremap <leader>qw {}<LEFT>
" inoremap <leader>wq []<LEFT>
" 
" inoremap <leader>as ""<LEFT>
" inoremap <leader>sa ''<LEFT>
" inoremap <leader>aa ;
" inoremap <leader>ss :
" inoremap <leader>zx <><LEFT>
" inoremap <leader>zz ,
" inoremap <leader>xx .
" inoremap <leader>cc /

" Learn from Emacs，short distance moving in insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-d> <DEL>

" Toggle the cursor line
nnoremap <leader>hl :set cursorline! <CR>
" Toggle the cursor column
nnoremap <leader>hc :set cursorcolumn! <CR>

" " Leader 的按键绑定
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

augroup filetype_yaml
    autocmd!
    autocmd BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2 shiftwidth=2 
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
    autocmd BufNewFile,BufRead *.py set foldmethod=indent
augroup END

augroup filetype_ruby
    autocmd!
    autocmd BufNewFile,BufRead *.rb set tags+=/home/wjh/.rvm/gems/ruby-2.3.0/gems/tags
augroup END

augroup filetype_go
    autocmd!
    autocmd BufNewFile,BufRead *.go nnoremap <leader>r :w<Enter>:!go run main.go<CR>
    autocmd BufNewFile,BufRead *.go nnoremap <leader>u :w<Enter>:!go test -v ./...<CR>
    autocmd BufNewFile,BufRead *.go set tags+=$GOLIB/src/tags
    autocmd BufWritePre,FileWritePre *.go GoImports
augroup END

augroup filetype_javscript
    autocmd!
    autocmd BufNewFile,BufRead *.js nmap <leader>r :w<Enter>:!node %<CR>
    autocmd BufNewFile,BufRead *.js nmap <leader>u :w<Enter>:!npm run test-local<CR>
augroup END

function! RunCurrentJavaTest()
    exec ":!mvn test -Dtest=" . expand("%:t:r") . "Tests"
endfunction

augroup filetype_java
    autocmd!
    " autocmd BufNewFile,BufRead *.java setlocal omnifunc=javacomplete#Complete
    " autocmd BufWritePre,FileWritePre *.java call javacomplete#AddImport()
    autocmd BufNewFile,BufRead *.java nmap <leader>i <Plug>(JavaComplete-Imports-AddSmart)
    autocmd BufNewFile,BufRead *.java nmap <leader>n <Plug>(JavaComplete-Generate-Accessors)
    autocmd BufNewFile,BufRead *.java nmap <leader>c :!mvn clean install<CR>
    autocmd BufNewFile,BufRead *.java nmap <leader>u :call RunCurrentJavaTest()<CR>
    autocmd BufNewFile,BufRead *.java nmap <leader>uu :!mvn test<CR>
    autocmd BufNewFile,BufRead *.java nmap <leader>r :!mvn spring-boot:run<CR>
    " autocmd BufWritePost *.java exec ":!ctags -R ."
augroup END

augroup filetype_kotlin
    autocmd!
    autocmd BufNewFile,BufRead *.kt set filetype=kotlin
augroup END

augroup filetype_dart
    autocmd!
    autocmd BufNewFile,BufRead *.dart set filetype=dart
    autocmd BufNewFile,BufRead *.dart set tabstop=2 softtabstop=2 shiftwidth=2 
augroup END

" vim-plug 插件管理
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Emmet html标签快速生成
Plug 'mattn/emmet-vim'
let g:user_emmet_mode = 'i'
" let g:user_emmet_expandabbr_key = '<C-y><TAB>'
imap <expr> <C-l> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_next_key = '<C-d>'
let g:user_emmet_prev_key = '<C-t>'
let g:user_emmet_install_global = 1

" NERDTree目录树插件
Plug 'scrooloose/nerdtree'
nnoremap <F4> :NERDTree<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=20
let g:NERDTreeShowLineNumbers=1

" NERDCommenter快速注释插件
Plug 'scrooloose/nerdcommenter'

" 变量函数树
" Plug 'vim-scripts/taglist.vim'

" 快速添加符号
Plug 'tpope/vim-surround'
" 使surround可重复
Plug 'tpope/vim-repeat'

" 多行光标
Plug 'terryma/vim-multiple-cursors'

" Rails
Plug 'tpope/vim-rails'

" 代码对齐
Plug 'godlygeek/tabular'

" " YouCompleteMe补全
" Plug 'Valloric/YouCompleteMe'
" 
" " YouCompleteMe补全配置
" "let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'
" " 修改ycm按键
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" " 配置成像一样IDE
" set completeopt=longest,menu
" " 退出insert模式后自动隐藏补全提示框
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" " 回车键选择补全项
" inoremap <expr> <CR>  pumvisible() ? "\<C-y>\<C-o>:pclose\<CR>\<C-o>l" : "\<CR>"
" " 禁用补全
" " nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
" " 注释和字符串中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_python_binary_path = '/usr/bin/python3'
" let g:ycm_filetype_blacklist = { 'dart': 1, 'sql': 1 }

" 重命名文件
Plug 'danro/rename.vim'

" Ctrlp 文件模糊查找
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<SPACE>f'
" TODO 根据不同的编程语言设置不同的 wildignore
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/dist/*,*/target/*,*/lib/*,*jnilibs/*,*/build/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/dist/*,*/target/*,*jnilibs/*,*/build/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" 缩进管理 <Leader>ig 快速切换开启状态
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" Vue
Plug 'posva/vim-vue'
" 识别vue文件进行高亮

" 全局搜索
Plug 'dyng/ctrlsf.vim' 

" 快速跳转
Plug 'Lokaltog/vim-easymotion'
nmap <Leader>j <Plug>(easymotion-prefix)
nmap <Leader>jj <Plug>(easymotion-j)
nmap <Leader>jk <Plug>(easymotion-k)
nmap <Leader>jh <Plug>(easymotion-linebackward)
nmap <Leader>jl <Plug>(easymotion-lineforward)
nmap <Leader>jw <Plug>(easymotion-bd-w)

" 代码块自动补全
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
" 自动补全括号, 引号
Plug 'jiangmiao/auto-pairs'

" JS补全
Plug 'marijnh/tern_for_vim'

" Tagbar
Plug 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<CR>

" Powerline
Plug 'Lokaltog/vim-powerline'
set laststatus=2

" Mkdir the dependency directories when you create a file
Plug 'pbrisbin/vim-mkdir'

" Ack.vim, Global search
Plug 'mileszs/ack.vim'
"<Leader>s进行搜索，同时不自动打开第一个匹配的文件"
nnoremap <Leader>s :Ack!<Space>
" 调用ag进行搜索
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
Plug 'junegunn/vim-easy-align'
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" git diff check
Plug 'airblade/vim-gitgutter'

Plug 'jceb/vim-orgmode'
augroup filetype_org
    autocmd!
    autocmd BufNewFile,BufRead *.org set filetype=org
augroup END

Plug 'tpope/vim-speeddating'

"Plug 'python-mode/python-mode'
"let g:pymode_python = 'python3'

" 语法检查
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" jsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0    " Allow JSX in normal JS files

" the plugin for go
Plug 'fatih/vim-go'

" allomancer theme
Plug 'Nequo/vim-allomancer'
set termguicolors " Remove this in urxvt

Plug 'altercation/vim-colors-solarized'

" toml syntax
Plug 'cespare/vim-toml'

" Docker file
Plug 'ekalinin/Dockerfile.vim'

" Carbon show
Plug 'kristijanhusak/vim-carbon-now-sh'
vnoremap <F5> :CarbonNowSh<CR>

" Java
Plug 'artur-shaik/vim-javacomplete2'
let g:JavaComplete_EnableDefaultMappings = 0

" Kotlin
Plug 'udalov/kotlin-vim'

" Flutter
Plug 'dart-lang/dart-vim-plugin'
let g:dart_style_guide = 2

" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'davidhalter/jedi-vim'

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 整理导包
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" coc-nvim 回车补全
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <leader>vt :vsp<Enter>:call CocAction("jumpDefinition")<Enter>

nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

vmap zg <Plug>(coc-codeaction-selected)

call plug#end()
