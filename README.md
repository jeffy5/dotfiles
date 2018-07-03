# Wjh's dotfiles

## Vimrc (.vimrc)

You should clone the Vundle and set it into `~/.vim/bundle` first.

Then open vim and input `:BundleInstall`, everything is ok.

And the `_vimrc` is used to windows.

### Keymap

#### Leader

I Use <space> as a leader key, but you should notice that you shouldn't map the
 keymap of related with leader in *INSERT* mode(You will find out that it will be
 a second to wait if you map it in *INSERT* mode. because vim think you still not
 finish you input).

- <leader>a a for align(vim-easy-align)
- <leader>r r for run
- <leader>t t for tags
- <leader>j j for jump
- <leader>v v for vsplit
- <leader>y y for yank
- <leader>p p for paste

#### Like Emacs

I use some emacs' keymap in INSERT mode.

``` vimscript
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-d> <DEL>
```

### TODO

- I want to just write one vimrc and let it works in every platforms.


## Tmux

You should install tmux first.

You can get more information from here -> [Tmux](https://github.com/tmux/tmux).

I set all keybindings as Vim. You can checkout in `.tmux.conf`, and the layout file in `.tmux` folder(To set the subwindow as IDE terminal).


## Change Ctrl with Caps-Lock

### Windows

You can install [AutoHotKey](https://www.autohotkey.com/), then just run the script `ctrl.ahk`.

### Linux (Ubuntu)

I have alias a `change` command in my `bashrc` file

``` bash
alias change=setxkbmap -option "ctrl:swapcaps"
```


## Zshrc

1. ctags: Used to generate `tags` file. Let vim can jump in each function.
2. SS: The command for editing the setting of network proxy (Ubuntu Unity)
3. GOPATH: Setting the gopath
4. VIMRC: Mark the config file of vim, then I can get vimrc with variable `$VIMRC` in Vim. For the command `:vsp $VIMRC<Enter>` can work correctly in vim.
