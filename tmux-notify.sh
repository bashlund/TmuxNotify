#!/bin/bash
# Author: Thomas Backlund.
# github.com/thomasbacklund
# MIT license
#
# Run without arguments to show help.

file=~/.tmux-notification.txt

function showUsage() {
    echo "Usage:"
    echo -e "\t$0 set \"Your Tmux notification\""
    echo -e "\tThe notification could include Tmux specific color codes, ex: \"#[bg=colour64,fg=white,bold]BUILD SUCCESS\", \"#[bg=colour160,fg=white,bold]BUILD FAILED\""
    echo
    echo -e "\t$0 get timeout"
    echo -e "\tReturn the notification if it is not older than \"timeout\" seconds. Default timeout is 10 seconds".
    echo
}

function getNotification() {
    timeout=$1
    if [ "$(( $(date +"%s") - $(stat -c "%Y" $file) ))" -lt "$timeout" ]; then
        cat $file
    fi
}

function setNotification() {
    echo $1 > $file
}

cmd=$1
if [[ "$cmd" = "set" ]]; then
    notification=$2
    setNotification "$notification"
    exit
elif [[ "$cmd" = "get" ]]; then
    timeout=${2:-10}
    getNotification $timeout
    exit
fi

showUsage
exit 1
