#!/bin/bash

alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias dc='docker-compose'
alias d='docker'
alias k='kubectl'
alias docker-purge-images='docker rmi $(docker images --quiet --filter "dangling=true")'

# weeks start on mondays and use cal format
alias cal='ncal -MC'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\    s*//;s/[;&|]\s*alert$//'\'')"'

# Qt containers top
alias docker-top='docker run -ti --name docker-top --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'

alias feh='feh --auto-zoom --geometry 500x375 --sort filename'

alias dmesg='dmesg -e'

ssr() {
    ssh root@$1
}
