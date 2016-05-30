#!/bin/bash -e

if [ -f /opt/eclipse/eclipse ]; then
    SCRATCH_DIR=$(mktemp -d);
    ICON_FILE=$(find /opt/eclipse -name eclipse256.png | head -n 1)
    echo "[Desktop Entry]
Type=Application
Version=1.0
Name=Eclipse
Icon=${ICON_FILE}
Exec=env SWT_GTK3=0 GTK_THEME=Adwaita:light /opt/eclipse/eclipse
Categories=Development;" > $SCRATCH_DIR/rombert-Eclipse.desktop
    xdg-desktop-menu install $SCRATCH_DIR/rombert-Eclipse.desktop

    rm -rf $SCRATCH_DIR
fi
    

