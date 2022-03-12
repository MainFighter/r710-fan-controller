#!/bin/bash

set -e

TARGETDIR="/fancontroller"

echo "*** Config file..."
if [ ! -d "$TARGETDIR/config" ]; then
    mkdir $TARGETDIR/config
fi
if [ ! -f "$TARGETDIR/config/fan_control.yaml" ]; then
    cp "$TARGETDIR/fan_control.yaml" "$TARGETDIR/config/fan_control.yaml"
fi

echo "*** Start fan controller..."
"$TARGETDIR/venv/bin/python3" -u "$TARGETDIR/fan_control.py" --config "$TARGETDIR/config/fan_control.yaml"

set +e