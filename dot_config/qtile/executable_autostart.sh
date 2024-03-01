#!/bin/bash

# Wallpaper
feh --no-fehbg --bg-fill --randomiz ~/Pictures/Wallpapers/* &
nm-applet &
picom --experimental-backend &
blueman-applet &
