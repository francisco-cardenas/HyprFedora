#!/bin/bash
# Install DevPod (https://www.devpod.sh) #

# Ensure we are in the project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || { echo "${ERROR} Failed to change directory to $PARENT_DIR"; exit 1; }

# Source global functions
if ! source "$PARENT_DIR/install-scripts/Global_functions.sh"; then
  echo -e "${ERROR} Failed to source Global_functions.sh"
  exit 1
fi

# Set log file
LOG="Install-Logs/install-$(date +%d-%H%M%S)_devpod.log"

echo -e "${NOTE} Installing ${SKY_BLUE}DevPod${RESET} ...\n"

(
  stdbuf -oL curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && \
  sudo install -c -m 0755 devpod /usr/local/bin && \
  rm -f devpod
) >> "$LOG" 2>&1 &
PID=$!
show_progress $PID "devpod"

# Verify install
if command -v devpod &>/dev/null; then
  echo -e "${OK} DevPod has been installed successfully!"
else
  echo -e "${ERROR} DevPod installation failed. Please check the log at $LOG"
fi

