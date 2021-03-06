#!/usr/bin/env bash

# HiDPI computers
HiDPIComputers=("Blade-Stealth")

# Set Height
BarHeight=17
font0="FiraCode Nerd Font Mono:size=10:sytle=Medium;2"
font1="FiraCode Nerd Font Mono:size=16:sytle=Medium;3"
font2="Noto Sans CJK JP:size=10:sytle=Medium;2"

for com in "${HiDPIComputers[@]}";
do
  if [ "$com" = "$(hostname)" ];
  then
    BarHeight=34
    font0="FiraCode Nerd Font Mono:size=20:sytle=Medium;4"
    font1="FiraCode Nerd Font Mono:size=32:sytle=Medium;6"
    font2="Noto Sans CJK JP:size=20:sytle=Medium;4"
  fi
done

# Network Interface
networkInterface1="eno1"

if [ "$(hostname)" = "Blade-Stealth" ]
then
  networkInterface1="enp58s0u1u4"
  networkInterface2="wlp1s0"
fi

# Temp
temp=$(for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done | grep Package | cut -d" " -f5)

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
    temp=$temp networkInterface1=$networkInterface1 networkInterface2=$networkInterface2 BarHeight=$BarHeight MONITOR=$monitor font0=$font0 font1=$font1 font2=$font2 polybar --reload primaryPolybar >>/tmp/polybar.log 2>&1 &
  done

  for monitor in $npm;
  do
    echo "---" | tee -a /tmp/polybar.log #/tmp/polybar2.log /tmp/polybar3.log
    temp=$temp networkInterface1=$networkInterface1 networkInterface2=$networkInterface2 BarHeight=$BarHeight MONITOR=$monitor font0=$font0 font1=$font1 font2=$font2 polybar --reload primaryPolybar >>/tmp/polybar.log 2>&1 &
  done
else
  echo "Primary monitor is not set"

  for monitor in $npm;
  do
    echo "---" | tee -a /tmp/polybar.log #/tmp/polybar2.log /tmp/polybar3.log
    temp=$temp networkInterface1=$networkInterface1 networkInterface2=$networkInterface2 BarHeight=$BarHeight MONITOR=$monitor font0=$font0 font1=$font1 font2=$font2 polybar --reload primaryPolybar >>/tmp/polybar.log 2>&1 &
  done
fi


echo "Bars launched..."
