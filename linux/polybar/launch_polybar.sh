#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR_TOP=$m polybar --reload top &
		MONITOR_BOTTOM=$m polybar --reload bottom &
	done
else
	polybar --reload top &
	polybar --reload bottom &
fi

echo "Bars launched..."