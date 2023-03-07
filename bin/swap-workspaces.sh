#!/bin/sh

workspaces=$(swaymsg -r -t get_workspaces)
visible_workspace=$(echo ${workspaces} | jq -r '.[] | select(.visible == true and .focused == false) | .num')
focused_workspace=$(echo ${workspaces} | jq -r '.[] | select(.focused == true) | .num')

swaymsg move workspace to output up

swaymsg workspace ${visible_workspace}
swaymsg move workspace to output up

