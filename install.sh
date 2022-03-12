#!/bin/bash

set -e

TARGETDIR="/fancontroller"

echo "*** Creating and activating Python3 virtualenv..."
if [ -d "$TARGETDIR/venv" ]; then
    echo "*** Existing venv found, purging it."
    rm -r "$TARGETDIR/venv"
fi
virtualenv -p python3 "$TARGETDIR/venv"
source "$TARGETDIR/venv/bin/activate"

echo "*** Installing Python dependencies..."
pip3 install -r requirements.txt

echo "*** Deactivating Python3 virtualenv..."
deactivate

echo "*** Copy config file..."
cp "$TARGETDIR/fan_control.yaml" "/tmp/fan_control.yaml"

set +e
