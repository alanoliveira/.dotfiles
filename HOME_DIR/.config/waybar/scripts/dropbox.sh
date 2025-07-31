#!/usr/bin/env bash
set -e

status=$(dropbox-cli status)
icon=""
case $status in
  *"Up to date"*)
    icon="󰇣"
    ;;
  *"Syncing"* | *"Updating"*)
    icon=""
    ;;
  *"Dropbox isn't running!"*)
    icon=""
    class="down"
    ;;
esac

printf '{"text": "%s", "tooltip": %s, "class": "%s"}\n' "$icon" "$(jq -Rn --arg v "$status" '$v')" "$class"
