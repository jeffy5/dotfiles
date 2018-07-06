# Change Ctrl and Caps
alias change='setxkbmap -option "ctrl:swapcaps"'

# ctags
alias tsrb='cd /home/wjh/.rvm/gems/ruby-2.3.0/gems && ctags -R *'
alias tspy='cd /usr/local/lib/python3.5/dist-packages && sudo ctags -R *'
alias ts='ctags -R *'
alias gogo='cd /home/wjh/project/go/src/github.com/wjh876531738/'

# Start shadowsocks
function ssStart() {
    sudo gsettings set org.gnome.system.proxy mode 'manual'
    sslocal -c ~/config/shadowsocks.json
}

# Stop shadowsocks
function ssStop() {
    sudo gsettings set org.gnome.system.proxy mode 'none'
}

export GOLIB=/home/wjh/project/go
export GOPATH=$GOLIB
export GOROOT=/usr/local/go  
export PATH=$PATH:$GOROOT/bin:$GOLIB/bin

export VIMRC="/home/wjh/project/dotfiles/.vimrc"
export TERM=xterm-256color
