#!/usr/bin/env sh

ENV="$XDG_STATE_HOME/eye_strain"
ID=0

if [ $XDG_CURRENT_DESKTOP == "GNOME" ] && [ -e $ENV ]; then
    source "$ENV"
fi

ID=$(/usr/bin/gdbus call --session \
    --dest=org.freedesktop.Notifications \
    --object-path=/org/freedesktop/Notifications \
    --method=org.freedesktop.Notifications.Notify \
    'Eye Strain Prevention' \
    $ID \
    '' \
    'Take a Break.' \
    'Focus on an object 20 feet away for 20 seconds.' \
    '[]' \
    '{"urgency": <1>}' \
    20000)

if [ $XDG_CURRENT_DESKTOP="GNOME" ]; then
    ID=${ID#* }
    ID=${ID%,*}
    echo "ID=$ID" > $ENV
fi
