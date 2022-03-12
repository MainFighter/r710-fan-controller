#!/bin/bash

set -e

TARGETDIR="/fancontroller"

echo "*** Cloning fan controller repo..."
git clone --branch docker https://github.com/MainFighter/r710-fan-controller.git "$TARGETDIR"

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

echo "*** Starting fan controller..."
$TARGETDIR/venv/bin/python3 -u $TARGETDIR/fan_control.py --config $TARGETDIR/fan_control.yaml

set +e
