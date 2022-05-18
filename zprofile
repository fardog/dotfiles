if [ "$(tty)" = "/dev/tty1" ]; then
  #export GDK_BACKEND=wayland
  export GTK_THEME=Adwaita-dark
  export CLUTTER_BACKEND=wayland
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  export QT_QPA_PLATFORM=wayland
  export QT_WAYLAND_FORCE_DPI=physical
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export QT_AUTO_SCREEN_SCALE_FACTOR=0
  export QT_SCALE_FACTOR=1
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export MOZ_ENABLE_WAYLAND=1
  export MOZ_WEBRENDER=1
  echo "initializing keychain, which should prompt for ssh key passwords on first login..."
  eval $(keychain --eval --dir $HOME/.config/keychain --quiet --agents gpg,ssh id_rsa)
  echo "keychain initialized."
  exec sway > log/sway.log 2>&1
fi 
