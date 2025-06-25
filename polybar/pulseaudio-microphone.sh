#!/bin/sh

status() {
  MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

  if [ "$MUTED" = "yes" ]; then
    echo "muted"
  else
    pactl get-source-volume @DEFAULT_SOURCE@ | awk -F'/' '/Volume:/ {gsub(/ /,""); print $2; exit}'
  fi
}

listen() {
  status

  LANG=EN; pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "source" || echo "$event" | grep -q "server"; then
      status
    fi
  done
}

toggle() {
  MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

  if [ "$MUTED" = "yes" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ 0
  else
    pactl set-source-mute @DEFAULT_SOURCE@ 1
  fi
}

increase() {
  pactl set-source-volume @DEFAULT_SOURCE@ +5%
}

decrease() {
  pactl set-source-volume @DEFAULT_SOURCE@ -5%
}

case "$1" in
  --toggle)
    toggle
    ;;
  --increase)
    increase
    ;;
  --decrease)
    decrease
    ;;
  *)
    listen
    ;;
esac
