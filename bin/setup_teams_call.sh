#!/bin/bash -eux

log() {
  echo "--> $@ <--"
}

stop_all() {
    log "Stop Teams and OBS studio"
    flatpak kill com.microsoft.Teams || true
    flatpak kill com.obsproject.Studio || true

    log "Stopping Android Webcam"
    systemctl --user stop android-webcam 
}

if [ $# -ne 1 ]; then
    echo "Usage $0 on|off"
    exit 1
fi

case "$1" in
    on)
        # stop all, to be sure
        stop_all

        log "Checking if headset is connected"
        pactl list sinks | grep 'bluez_sink'

        log "Reloading NoiseTorch"
        # unload noise torch
        noisetorch -u 
        noisetorch -i

        log "Setting up Android Webcam"
        systemctl --user start android-webcam

        log "Waiting for Webcam to be set up"
        sleep 5

        log "Starting up OBS studio"
        flatpak run com.obsproject.Studio --scene 'Scrum points' --startvirtualcam &
        sleep 5

        log "Launching Teams"
        flatpak run com.microsoft.Teams
        ;;
    off)
        stop_all
        ;;
    *)
        echo "Usage $0 on|off"
        exit 1
        ;;
esac



