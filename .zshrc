# Oh-my-zsh theme
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# Change Ctrl and Caps
alias change='setxkbmap -option "ctrl:swapcaps"'

# ctags
alias tsrb='cd /home/wjh/.rvm/gems/ruby-2.3.0/gems && ctags -R *'
alias tspy='cd /usr/local/lib/python3.5/dist-packages && sudo ctags -R *'
alias tsgo='cd $GOLIB/src && ctags -R *'
alias ts='ctags -R *'
alias gogo='cd /home/wjh/project/go/src/github.com/xr-hui/'

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
export GOLIB=/home/wjh/project/go
export GOPATH=$GOLIB
export GOROOT=/usr/local/share/go  
export PATH=$PATH:$GOROOT/bin:$GOLIB/bin

# Vim ENV
export VIMRC="/home/wjh/project/dotfiles/.vimrc"
export TERM=xterm-256color

# Alias
alias home='ssh wjh@120.78.90.156'
alias web='ssh web@192.168.1.100'
