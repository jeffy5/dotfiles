# Change Ctrl and Caps
alias change='setxkbmap -option "ctrl:swapcaps"'

# ctags
alias tsrb='cd /home/wjh/.rvm/gems/ruby-2.3.0/gems && ctags -R *'
alias tspy='cd /usr/local/lib/python3.5/dist-packages && sudo ctags -R *'
alias ts='ctags -R *'

# Start shadowsocks
function ssStart() {
    sudo gsettings set org.gnome.system.proxy mode 'manual'
    sslocal -c ~/config/shadowsocks.json
}

# Stop shadowsocks
function ssStop() {
    sudo gsettings set org.gnome.system.proxy mode 'none'
}
