#!/bin/sh
# set -x

# Function to identify the operating system
identify_os() {
    case "$(uname -s)" in
        Linux*)     echo Linux;;
        Darwin*)    echo MacOS;;
        *)          echo "Unknown OS"; exit 1;;
    esac
}
OS=$(identify_os)

if [ "$OS" = "Linux" ]; then
  UPDATE_CMD="./update-nixos.sh"
elif [ "$OS" = "MacOS" ]; then
  UPDATE_CMD="./update-macos.sh"  
else
    echo "Unsupported operating system."
    exit 1
fi
cmd_to_run='sudo fd . | entr $UPDATE_CMD'

#if [ "$TERM_PROGRAM" = tmux ]; then
#  tmux split-window -v -p 20 "$cmd_to_run"
#else
  eval "$cmd_to_run"
#fi
