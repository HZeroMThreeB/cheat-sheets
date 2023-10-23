#!/bin/sh
ALERT="Signature detected by clamav: $CLAM_VIRUSEVENT_VIRUSNAME in $CLAM_VIRUSEVENT_FILENAME"
touch /tmp/virus
# Send an alert to all graphical users.
for ADDRESS in /run/user/*; do
    USERID=${ADDRESS#/run/$USER/}
    sudo -u "#$USERID" DBUS_SESSION_BUS_ADDRESS="unix:path=$ADDRESS/bus" \
        notify-send -i dialog-warning "Virus found!" "$ALERT"
done
