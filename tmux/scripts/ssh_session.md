For the ssh_session host name to appear on the status bar
you will have to copy this ssh_session.sh script to the status directory
in tmux at location ~/.config/tmux/plugins/tmux/status and add the below lines
to the tmux conf file.

```bash
set -g @catppuccin_status_modules_right "ssh_session date_time"
```

    
