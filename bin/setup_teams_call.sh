#!/bin/bash -eux

log() {
  echo "--> $@ <--"
}

# quit all, to be sure
log "Killing Teams and OBS studio"
flatpak kill com.microsoft.Teams || true
flatpak kill com.obsproject.Studio || true

log "Reloading NoiseTorch"
# unload noise torch
noisetorch -u 
noisetorch -i

log "Setting up Android Webcam"
systemctl --user stop android-webcam 
systemctl --user start android-webcam

log "Waiting for Webcam to be set up"
sleep 5

log "Starting up OBS studio"
flatpak run com.obsproject.Studio --scene 'Scrum points' --startvirtualcam &
sleep 5

log "Checking if headset is connected"
pactl list sinks | grep 'bluez_sink'

log "Launching Teams"
flatpak run com.microsoft.Teams
