#!/bin/sh -e

# Take a screenshot
rm /tmp/screen_locked.png || true
scrot /tmp/screen_locked.png

# Pixellate it 10x
corrupter -mag 2 -boffset 35 /tmp/screen_locked.png /tmp/screen_locked.png
# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png

# Turn the screen off after a delay.
#sleep 60; pgrep i3lock && xset dpms force off
