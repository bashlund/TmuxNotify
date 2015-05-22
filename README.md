#TmuxNotify
Have build notifications show up in your tmux statusbar.

You could of course use it for any types of notifications you want to set from bash.

##Installation
```
git clone git@github.com:thomasbacklund/TmuxNotify.git ~/.TmuxNotify
```
Edit your `~/.tmux.conf` and merge from `tmux-sample.conf`.
The most important lines are:
```
# Refresh the statusbar every second.
set -g status-interval 1

# Execute the bash script to get the notification, if it's not older than 10 seconds.
set -g status-right '(~/.TmuxNotify/tmux-notify.sh get 10)'

```
##Usage
How to set a notification:
```
~/.TmuxNotify/tmux-notify.sh set "Hello World"
```
How to get a notification, no older than 15 seconds:
```
~/.TmuxNotify/tmux-notify.sh get 15
```
You could add tmux color codes to your notifications, like `#[bg=colour64,fg=white,bold]Hello World`.

To have a default colored text that says BUILDING... in your tmux statusbar, that will show for x seconds.
```
~/.TmuxNotify/tmux-notify.sh set "BUILDING..."
```

To have a white on green text that says BUILD SUCCESS in your tmux statusbar, that will show for x seconds.
```
~/.TmuxNotify/tmux-notify.sh set "#[bg=colour64,fg=white,bold]BUILD SUCCESS"
```
To have a white on red text that says BUILD FAILED in your tmux statusbar, that will show for x seconds.
```
~/.TmuxNotify/tmux-notify.sh set "#[bg=colour160,fg=white,bold]BUILD FAILED"
```
###Using it in your build scripts
Find places in your build scripts where a build starts, fails and succeeds, and place
`~/.TmuxNotify/tmux-notify.sh set "notification"` there. Remember to put in some beautiful color codes too.
