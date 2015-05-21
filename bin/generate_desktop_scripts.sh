#!/bin/bash -e

if [ -f /opt/eclipse/eclipse ]; then
    SCRATCH_DIR=$(mktemp -d);
    ICON_FILE=$(find /opt/eclipse -name eclipse256.png)
    echo "[Desktop Entry]
Type=Application
Version=1.0
Name=Eclipse
Icon=${ICON_FILE}
Exec=/opt/eclipse/eclipse
Categories=Development;" > $SCRATCH_DIR/rombert-Eclipse.desktop
    xdg-desktop-menu install $SCRATCH_DIR/rombert-Eclipse.desktop
fi
    

