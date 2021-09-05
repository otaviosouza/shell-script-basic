#!/usr/bin/env bash

CONF_FILE="settings.cf"

MSG="Test message"

COLORFUL=
CAPITAL=

GREEN="\033[32m"
NC="\033[0m"

eval "$(./parser.sh $CONF_FILE)"

[ $"$CONF_COLORFUL" -eq 1 ] && COLORFUL=1
[ $"$CONF_CAPITAL" -eq 1 ] && CAPITAL=1

[ "$CAPITAL" -eq 1 ] && MSG="$(echo -e "$MSG" | tr '[:lower:]' '[:upper:]')"
[ "$COLORFUL" -eq 1 ] && MSG="$(echo -e "${GREEN}$MSG${NC}")"

echo -e "$MSG"