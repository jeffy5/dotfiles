# Oh-my-zsh theme
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# Import plugins
plugins=(git autojump)

# Change Ctrl and Caps
alias change='setxkbmap -option "ctrl:swapcaps"'

# ctags
alias tsrb='cd $HOME/.rvm/gems/ruby-2.3.0/gems && ctags -R *'
alias tspy='cd /usr/local/lib/python3.5/dist-packages && sudo ctags -R *'
alias tsgo='cd $GOLIB/src && ctags -R *'
alias ts='ctags -R *'
alias gogo='cd $HOME/project/go/src/github.com/xr-hui/'

# Start shadowsocks
function ssStart() {
    sudo gsettings set org.gnome.system.proxy mode 'manual'
    sslocal -c ~/config/shadowsocks.json
}

# Stop shadowsocks
function ssStop() {
    sudo gsettings set org.gnome.system.proxy mode 'none'
}

# Go ENV
export GOLIB=$HOME/project/go
export GOPATH=$GOLIB
export GOROOT=/usr/local/go
export GOPROXY=https://goproxy.cn
export PATH=$PATH:$GOROOT/bin:$GOLIB/bin

# Vim ENV
export VIMRC=$HOME/project/dotfiles/.vimrc
export TERM=xterm-256color

# Server
alias home='ssh wjh@wujianhui.top'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# android NDK Config
export PATH=$PATH:$HOME/Library/Android/sdk/ndk-bundle
export A_NDK_ROOT=$HOME/Library/Android/sdk/ndk-bundle
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# Auto jump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
