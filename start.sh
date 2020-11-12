#!/bin/bash

# Note: if this is not working, refer to INSTALL.MD

nvidia-docker run --rm -tid -p 8888:8888 \
--hostname deepfakes-gpu --name deepfakes-gpu \
-v "$(pwd)"/:/srv \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix"$DISPLAY" \
-e AUDIO_GID="$(getent group audio | cut -d: -f3)" \
-e VIDEO_GID="$(getent group video | cut -d: -f3)" \
-e GID="$(id -g)" \
-e UID="$(id -u)" \
deepfakes-gpu

echo "Run: docker exec deepfakes-gpu python /srv/faceswap.py gui"