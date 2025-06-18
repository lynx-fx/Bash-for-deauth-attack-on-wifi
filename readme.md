# 🔥 Wi-Fi Deauthentication Attack Script

A Bash script that automates the process of scanning for Wi-Fi networks and performing a deauthentication attack using `aircrack-ng` tools.

> ⚠️ **For educational and authorized testing purposes only. Do not use this script on networks you do not own or have explicit permission to test.**

---

## 🛠 Features

- Scan for nearby Wi-Fi networks using `nmcli`
- Prompt for target BSSID and channel
- Enables monitor mode automatically
- Performs continuous deauthentication attack using `aireplay-ng`
- Interactive key commands:
  - `P` – Pause the attack
  - `R` – Resume the attack
  - `S` or `Enter` – Stop the attack and restore Wi-Fi

---

## 📦 Requirements

- Linux (tested on Debian/Ubuntu)
- Root access (`sudo`)
- Wireless adapter that supports monitor mode and packet injection
- Required tools:
  - [`aircrack-ng`](https://www.aircrack-ng.org/)
  - `network-manager`
  - `nmcli`

### ✅ Install dependencies (Debian/Ubuntu)

```bash
sudo apt update
sudo apt install -y aircrack-ng network-manager
