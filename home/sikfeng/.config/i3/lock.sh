#!/usr/bin/env bash
ICON=$HOME/.config/i3/lock.png
#BG=/tmp/screen.png
BG=/usr/share/archlinux/wallpaper/x220-exploded.png
TEXT=/tmp/locktext.png
#scrot $BG
LOCKBG=/tmp/screen.png
cp $BG $LOCKBG
#convert $BG -scale 5% -scale 2000% -fill black -colorize 25% $BG
[ -f $TEXT ] || {
    convert -size 3000x60 xc:white -font Liberation-Sans -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $TEXT;
    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
}

convert $LOCKBG $TEXT -gravity center -geometry +0+200 -composite $LOCKBG
convert $LOCKBG $ICON -gravity center -composite -matte $LOCKBG

set -e
xset s off dpms 0 10 0
i3lock -u -i $LOCKBG
xset s off -dpms
rm $LOCKBG
rm $TEXT
