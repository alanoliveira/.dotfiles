#!/usr/bin/env bash

if gh api notifications --jq '.[].unread' | grep -q true; then
  echo ""
fi
