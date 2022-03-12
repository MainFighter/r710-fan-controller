#!/bin/bash

set -e

TARGETDIR="/fancontroller"

echo "*** Config file..."
if [ ! -d "$TARGETDIR/fancontrol/config" ]; then
    mkdir $TARGETDIR/fancontrol/config
fi
if [ ! -f "$TARGETDIR/fan_control.yaml" ]; then
    cp "/tmp/fan_control.yaml" "$TARGETDIR/config/fan_control.yaml"
fi
if [ -f "/tmp/fan_control.yaml" ]; then
    rm "/tmp/fan_control.yaml"
fi

echo "*** Start fan controller..."
"/fancontroller/venv/bin/python3" -u "/fancontroller/fan_control.py" --config "/fancontroller/config/fan_control.yaml"

set +e