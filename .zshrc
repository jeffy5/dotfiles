# Oh-my-zsh theme
export ZSH=$HOME/.oh-my-zsh ZSH_THEME="robbyrussell"
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
# alias vim='/usr/local/bin/vim'

# Start shadowsocks
function ssStart() {
    gsettings set org.gnome.system.proxy mode 'manual'
    ~/software/v2ray/v2ray
}

# Stop shadowsocks
function ssStop() {
    gsettings set org.gnome.system.proxy mode 'none'
}

# Go ENV
export GOLIB=$HOME/project/go
export GOPATH=$GOLIB
# export GOROOT=/usr/local/share/go
export GOPROXY=https://goproxy.cn
export GO111MODULE=on
# export PATH=$PATH:$GOROOT/bin:$GOLIB/bin
export PATH=$PATH:$GOLIB/bin

# Vim ENV
export VIMRC=$HOME/project/dotfiles/.vimrc
# export TERM=xterm-256color

# Server
alias home='ssh wjh@wujianhui.com'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# android NDK Config
# export A_NDK_ROOT=$HOME/Library/Android/sdk/ndk-bundle
# export PATH=$PATH:$A_NDK_ROOT
export ANDROID_HOME=$HOME/.android
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$JAVA_HOME/bin

# Flutter env
export FLUTTER_CHANNEL="stable"
export PATH=$PATH:/usr/local/share/flutter_$FLUTTER_CHANNEL/bin
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Auto jump
# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

# export http_proxy=http://127.0.0.1:1087
# export https_proxy=$http_proxy

# Esp
export IDF_PATH=$HOME/project/esp/ESP8266_RTOS_SDK

export LC_ALL=en_US.UTF-8

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
