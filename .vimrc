runtime! debian.vim

if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 设置编码
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

" 解决和tmux的颜色冲突问题
colorscheme ron

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

" Disable the leader key in insert mode, or there will be a second pause when you
" press leader key. Use `verbose imap <leader>` to check whick key bind in the
" insert mode with leader key, just ban it.
let mapleader=" "

" 清屏并去掉高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <C-c> <C-[>

" 括号自动匹配
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>
"inoremap <TAB> <c-r>=SkipPair()<CR>

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-d> <DEL>

vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <F2> :!ici <C-R><C-W><CR>
nnoremap <Leader><Leader> :

autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.rb,*.vue set tabstop=2 softtabstop=2 shiftwidth=2 
autocmd BufNewFile,BufRead *.py nmap <leader>r :w<Enter>:!python3 %<CR>
autocmd BufNewFile,BufRead *.go nmap <leader>r :w<Enter>:!go run %<CR>
autocmd BufNewFile,BufRead *.rb nmap <leader>r :w<Enter>:!ruby %<CR>
autocmd BufNewFile,BufRead *.js nmap <leader>r :w<Enter>:!node %<CR>
autocmd BufNewFile,BufRead *.vue set filetype=html 
autocmd BufNewFile,BufRead *.vue,*.html syntax sync fromstart 

"function ClosePair(char)
    "if getline('.')[col('.') - 1] == a:char
        "return "\<Right>"
    "else
        "return a:char
    "endif
"endf

"function QuoteDelim(char)
    "let line = getline('.')
    "let col = col('.')
    "if line[col - 2] == "\\"
        "return a:char
    "elseif line[col - 1] == a:char
        "return "\<Right>"
    "else
        "return a:char.a:char."\<Esc>i"
    "endif
"endf

"function SkipPair()  
    "if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'"
        "return "\<ESC>la"  
    "else  
        "return "\t"  
    "endif  
"endf

" Vundle管理插件
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on
" Below here to add the vundle what I want

" Emmet html标签快速生成
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode='i'
"let g:user_emmet_expandabbr_key='<Tab>'
let g:user_emmet_next_key='<C-d>'
let g:user_emmet_prev_key='<C-t>'
let g:user_emmet_install_global=1
imap <expr> <C-l> emmet#expandAbbrIntelligent("\<tab>")

" NERDTree目录树插件
Plugin 'scrooloose/nerdtree'
nmap <F4> :NERDTree  <CR>
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
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 修改ycm按键
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
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
let g:ycm_python_binary_path = '/usr/bin/python3'

"let g:ycm_auto_trigger=1

" 重命名文件
Plugin 'danro/rename.vim'

" Ctrlp 文件模糊查找
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/dist/*

" 缩进管理 <Leader>ig 快速切换开启状态
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" Vue高亮
" Plugin 'posva/vim-vue'

" 识别vue文件进行高亮
" autocmd BufNewFile,BufRead *.vue set filetype=vue 
" autocmd FileType vue syntax sync fromstart

" 全局搜索
Plugin 'dyng/ctrlsf.vim' 

" 快速跳转
Plugin 'Lokaltog/vim-easymotion'
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>w <Plug>(easymotion-bd-w)

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
nmap <F8> :TagbarToggle<CR>

" Powerline
Plugin 'Lokaltog/vim-powerline'
set laststatus=2

" Mkdir the dependency directories when you create a file
Plugin 'pbrisbin/vim-mkdir'

" ctags config, code jump
autocmd BufNewFile,BufRead *.rb set tags+=/home/wjh/.rvm/gems/ruby-2.3.0/gems/tags
autocmd BufNewFile,BufRead *.py set tags+=/usr/local/lib/python3.5/dist-packages/tags
nmap <Leader>vn :vsp<cr><C-]>
nmap <Leader>n <C-]>
nmap <Leader>vN :vsp<cr>g]
nmap <Leader>N g]

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

" Vim org-mode
Plugin 'jceb/vim-orgmode'
autocmd BufNewFile,BufRead *.org set filetype=org

" Use <C-a> to create the date
Plugin 'tpope/vim-speeddating'

"Plugin 'python-mode/python-mode'
"let g:pymode_lint_cwindow = 0

Plugin 'w0rp/ale'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:syntastic_javascript_checkers = ['eslint']

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0    " Allow JSX in normal JS files
