#!/usr/bin/env sh

/usr/sbin/toolbox run \
  rclone bisync \
    $HOME/Documents \
    "Personal google drive:Rclone Documents" \
    --create-empty-src-dirs
