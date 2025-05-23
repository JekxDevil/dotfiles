#!/bin/sh
set -e
xset s off dpms 0 10 120
i3lockmore --image-fill '/home/gief/Pictures/gnu-is-not-unix.jpg' -t --ignore-empty-password --show-failed-attempts --nofork
xset s off -dpms
