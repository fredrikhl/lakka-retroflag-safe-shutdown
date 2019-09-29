#!/bin/bash

# Script Config
TIMEZONE_FILE="/storage/.cache/timezone"
DEFAULT_TIMEZONE="Europe/Oslo"
AUTOSTART_SCRIPT="/storage/.config/autostart.sh"

# On Lakka the default user id is 0
if ! [ $(id -u) = 0 ]; then
   echo "Please execute script as root (on Lakka this should be the default user)." 
   exit 1
fi

# Set timezone
read -p "Enter your timezone [${DEFAULT_TIMEZONE}]:" USER_TIMEZONE
USER_TIMEZONE=${USER_TIMEZONE:-${DEFAULT_TIMEZONE}}
echo "Using timezone ${USER_TIMEZONE}"
echo "TIMEZONE=${USER_TIMEZONE}" > "${TIMEZONE_FILE}"

# Install scripts
mkdir -p /storage/scripts
cp -R scripts/* /storage/scripts/

# Set autostart
if [ ! -f "${AUTOSTART_SCRIPT}" ]; then
    echo "(cd /storage/scripts && python /storage/scripts/safe_shutdown.py &)" >> "${AUTOSTART_SCRIPT}"
fi

# Check success
if grep -Fxq "safe_shutdown.py" "${AUTOSTART_SCRIPT}"
then
    echo "Error installing scripts, autostart configuration failed..."
    echo "Manually place 'python /storage/scripts/safe_shutdown.py &' in ${AUTOSTART_SCRIPT}"
else
    echo "Success installing scripts."
    echo "Will now reboot after 3 seconds."
    sleep 3
    reboot
fi
