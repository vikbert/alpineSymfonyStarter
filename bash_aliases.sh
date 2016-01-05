#! /bin/bash
echo 'set alias succeed !'

alias dup='cd /vagrant && docker-compose up -d'
alias dps='cd /vagrant && docker-compose ps'
alias dimages='cd /vagrant && docker-compose images'

alias dstop='cd /vagrant && docker-compose stop'
alias dstart='cd /vagrant && docker-compose start'
alias drm-all='docker rm -f $(docker ps -a -q)'
alias drmi-all='docker rmi -f $(docker images -q)'
