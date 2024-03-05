#!/usr/bin/env bash

journalctl -fu spice-vdagentd -g 'invalid message size for VDAgentMonitorsConfig' -n0 |
	while read line; do
		echo "window changed, resizing"
		xrandr --output Virtual-1 --auto
	done
