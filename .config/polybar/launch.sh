#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
pm=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
npm=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

if [[ -v pm ]]
then
  echo "Primary monitor is set"

  for monitor in $pm;
  do
    echo "---" | tee -a /tmp/polybar.log #/tmp/polybar2.log /tmp/polybar3.log
    MONITOR=$monitor polybar --reload primaryPolybar >>/tmp/polybar.log 2>&1 &
  done

  for monitor in $npm;
  do
    echo "---" | tee -a /tmp/polybar.log #/tmp/polybar2.log /tmp/polybar3.log
    MONITOR=$monitor polybar --reload primaryPolybar >>/tmp/polybar.log 2>&1 &
  done
else
  echo "Primary monitor is not set"

  for monitor in $npm;
  do
    echo "---" | tee -a /tmp/polybar.log #/tmp/polybar2.log /tmp/polybar3.log
    MONITOR=$monitor polybar --reload primaryPolybar >>/tmp/polybar.log 2>&1 &
  done
fi


echo "Bars launched..."
