# Wjh's dotfiles

## Vimrc (.vimrc)

You should clone the Vundle and set it into `~/.vim/bundle` first.

Then open vim and input `:BundleInstall`, everything is ok.

And the `_vimrc` is used to windows.

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

```
alias change=setxkbmap -option "ctrl:swapcaps"
```


## Zshrc