#!/bin/bash

set -e

TARGETDIR="/fancontroller"

echo "*** Copy config file..."
if [ ! -f "$TARGETDIR/fan_control.yaml" ]; then cp "/tmp/fan_control.yaml" "$TARGETDIR/fan_control.yaml" fi
if [ -f "/tmp/fan_control.yaml" ]; then rm "/tmp/fan_control.yaml" fi

echo "*** Start fan controller..."
"/fancontroller/venv/bin/python3" -u "/fancontroller/fan_control.py" --config "/fancontroller/fan_control.yaml"

set +e
