#!/bin/sh
xset -dpms
xset s off
xset s noblank

unclutter &
chromium-browser 'https://www.nforza.nl' --window-size=1920,1080 \
    --start-fullscreen --kiosk --incognito --noerrdialogs \
    --disable-translate --no-first-run --fast --fast-start \
    --disable-infobars --disable-features=TranslateUI \
    --disk-cache-dir=/dev/null --password-store=basic