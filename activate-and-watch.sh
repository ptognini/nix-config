#!/bin/sh

#set -x 
cmd_to_run='sudo fd . |sudo entr nixos-rebuild --flake .#$(hostname) switch'

if [ "$TERM_PROGRAM" = tmux ]; then
  tmux split-window -v -p 20 "$cmd_to_run"
else
  eval "$cmd_to_run"
fi
