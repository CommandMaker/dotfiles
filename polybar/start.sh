#!/bin/bash

mapfile -t MONITORS < <(xrandr -q | grep connected | awk -F ' ' '{print $1}')

for monitor in "${MONITORS[@]}"
do
    # Start all Polybars for each monitor

    MONITOR=$monitor polybar calendar &
    MONITOR=$monitor polybar workspaces &
    MONITOR=$monitor polybar audio &
    MONITOR=$monitor polybar info &
done
