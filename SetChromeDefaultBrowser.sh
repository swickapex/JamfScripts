#!/bin/bash

# Created by Steven Wick for TripActions

# Set Defualt Browser to Google Chrome
msda set com.google.chrome -p http -p https -u public.url all -u public.html viewer -u public.xhtml all -fut
# give extra time for system to set defualt browser
sleep 15
# Check the Current default Browser
checkdefaultbrowser=$(plutil -p ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist | grep 'https' -b3 | awk 'NR==3 {split($4, arr, "\""); print arr[2]}')

if  [ "$checkdefaultbrowser" != "com.google.chrome" ]; then
	echo "error: Chrome is NOT the default browser"
	exit 1
else
	echo "Chrome is the default browser"
	exit 0
fi