if [[ "$2" = 'dwm' ]]; then
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx

  export _JAVA_AWT_WM_NONREPARENTING=1
  
  compton -b
  feh --bg-fill /usr/share/archlinux/wallpaper/x220-exploded.png
  /usr/bin/start-pulseaudio-x11 &
  #xss-lock -- ~/.config/i3/lock.sh &
  while true
  do
    ~/bin/dwm_status
    sleep 1
  done &

  systemctl --user import-environment DISPLAY
  fcitx &
  exec dwm
elif [[ "$2" = 'i3' ]]; then
  exec i3
fi
