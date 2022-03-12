#!/bin/bash

set -e

TARGETDIR="/fancontroller"

echo "*** Copy config file..."
cp "/tmp/fan_control.yaml" "$TARGETDIR/fan_control.yaml"
rm "/tmp/fan_control.yaml"

echo "*** Start fan controller..."
"/fancontroller/venv/bin/python3" -u "/fancontroller/fan_control.py" --config "/fancontroller/fan_control.yaml"

set +e
