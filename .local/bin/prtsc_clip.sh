#! /bin/bash

scrot -s /tmp/prtsc_clip.png
xclip -selection clipboard -t image/png -i /tmp/prtsc_clip.png