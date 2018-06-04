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
nmap <Leader>p "+p
nmap <F2> :!ici <C-R><C-W><CR>
nmap <Leader><Leader> :

autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.rb,*.vue set tabstop=2 softtabstop=2 shiftwidth=2 
autocmd BufNewFile,BufRead *.py nmap <C-c><C-c> :w<Enter>:!python3 %<CR>
autocmd BufNewFile,BufRead *.rb nmap <C-c><C-c> :w<Enter>:!ruby %<CR>

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

" 插件配置
filetype off  
" 此处规定Vundle的路径  
set rtp+=$VIM/vimfiles/bundle/vundle/  
call vundle#rc('$VIM/vimfiles/bundle/')  
Bundle 'gmarik/vundle'  
filetype plugin indent on


" Emmet html标签快速生成
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode = 'i'
" let g:user_emmet_expandabbr_key = '<C-y><TAB>'
let g:user_emmet_next_key = '<C-d>'
let g:user_emmet_prev_key = '<C-t>'
let g:user_emmet_install_global = 1
imap <expr> <C-f> emmet#expandAbbrIntelligent("\<tab>")

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
" Plugin 'Valloric/YouCompleteMe'

" YouCompleteMe补全配置
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'
" 修改ycm按键
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 配置成像一样IDE
" set completeopt=longest,menu
" 退出insert模式后自动隐藏补全提示框
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车键选择补全项
" inoremap <expr> <CR>  pumvisible() ? "\<C-y>\<C-o>:pclose\<CR>\<C-o>l" : "\<CR>"
" 禁用补全
" nnoremap <leader>y :let g:ycm_auto_trigger=1<CR>
" 注释和字符串中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_python_binary_path = '/usr/bin/python3'

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
Plugin 'posva/vim-vue'

" 识别vue文件进行高亮
autocmd BufNewFile,BufRead *.vue set filetype=vue 
autocmd FileType vue syntax sync fromstart

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
nmap <Leader>vn :vsp<C-]>
nmap <Leader>n <C-]>
nmap <Leader>vN :vspg]
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
