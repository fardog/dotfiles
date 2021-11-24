if [ "$(tty)" = "/dev/tty1" ]; then
  #export GDK_BACKEND=wayland
  export CLUTTER_BACKEND=wayland
  export XDG_SESSION_TYPE=wayland
  export QT_QPA_PLATFORM=wayland-egl
  export QT_WAYLAND_FORCE_DPI=physical
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export MOZ_ENABLE_WAYLAND=1
  export MOZ_WEBRENDER=1
  eval $(keychain --eval --dir $HOME/.config/keychain --quiet --noask --agents gpg,ssh id_rsa)
  exec sway
fi 
