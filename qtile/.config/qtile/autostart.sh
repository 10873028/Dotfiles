#!/usr/bin/env bash

xset r rate 300 50
setxkbmap -option caps:escape
fcitx5 &
picom --no-dock-shadow --no-dnd-shadow --no-fading-openclose --experimental-backends --vsync &
xautolock -time 30 -locker "slock" -killtime 60 -killer "systemctl suspend" -detectsleep -corners -00+ &
