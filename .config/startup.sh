#!/bin/bash

pgrep -x alacritty >/dev/null && echo "Alacritty already running..." || alacritty &
pgrep -x emacs >/dev/null && echo "Emacs already running..." || emacs &
pgrep -x firefox >/dev/null && echo "Firefox already running..." || firefox &
