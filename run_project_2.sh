#!/bin/bash

# Configuration
# REPO_URL="https://github.com/username/repository"  # without .git
# PROGRAM_NAME="main.py"

REPO_URL="https://github.com/exploittracer/keystroke-logger"
PROGRAM_NAME="keystroke_printer.py"


echo "[+] Downloading repository as ZIP..."
wget -O repo.zip "$REPO_URL/archive/refs/heads/main.zip"

if [ $? -ne 0 ]; then
    echo "[-] Download failed. Check URL and branch name."
    exit 1
fi

echo "[+] Extracting ZIP..."
unzip -q repo.zip

# Find the extracted directory (GitHub names it repo-branch)
DIR_NAME=$(unzip -l repo.zip | head -5 | tail -1 | awk '{print $NF}' | cut -d'/' -f1)
cd "$DIR_NAME" || { echo "[-] Failed to enter directory"; exit 1; }

echo "[+] Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

if [ -f "requirements.txt" ]; then
    echo "[+] Installing libraries..."
    pip install -r requirements.txt
fi

echo "[+] Running $PROGRAM_NAME..."
python3 "$PROGRAM_NAME"

deactivate
cd ..
rm -f repo.zip