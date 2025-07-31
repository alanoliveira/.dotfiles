#!/usr/bin/env bash
set -e

cleanup() {
    kill "$dbus_pid" 2>/dev/null
}
trap cleanup EXIT INT TERM


symbol() {
  case $1 in
  *mozc*) echo 'あ' ;;
  *keyboard-us-intl*) echo 'Á' ;;
  *keyboard-us*) echo 'A' ;;
  *) echo '?' ;;
  esac
}

dbus-monitor --session type=method_call,member=SetCurrentIM |
while read -r line; do
  if [[ $line =~ string ]]; then
    im_name=$(fcitx5-remote -n)
    printf '{"text": "%s", "tooltip": "%s"}\n' "$(symbol $im_name)" "$im_name"
  fi
done &
dbus_pid=$!

wait $dbus_pid
