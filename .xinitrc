#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

/usr/bin/VBoxClient-all

# exec gnome-session
# exec startkde
# exec startxfce4
exec awesome -c ~/.config/awesome/rc.lua
# ...or the Window Manager of your choice

