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
```

Follow these steps to clone, set up, and run the script:

1.  **Clone or download the script:**

    ```bash
    git clone [https://github.com/your-username/wifi-deauth-script.git](https://github.com/your-username/wifi-deauth-script.git)
    cd wifi-deauth-script
    ```

2.  **Make the script executable:**

    ```bash
    chmod +x wifi-deauth.sh
    ```

3.  **Run the script with root privileges:**

    ```bash
    sudo ./wifi-deauth.sh
    ```

4.  **Follow prompts:**
    * You'll see a list of available Wi-Fi networks.
    * Enter the BSSID and channel of the target network when prompted.
    * Use the following keys during the attack:
        * `P` – Pause
        * `R` – Resume
        * `S` or `Enter` – Stop and restore network

## 📁 File Structure

```bash
.
├── wifi-deauth.sh           # Main script to launch attack
├── install_dependencies.sh  # (Optional) Bash script to install dependencies
└── README.md                # Project documentation
