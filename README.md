# Arch Bootstrap

> ⚠️ **Personal Setup:**  
> This is how I like to bootstrap my laptop.  

---

## Installation Workflow

### 1. Boot & Connect to WiFi

- Boot from the Arch ISO USB.
- Set up WiFi using `iwctl`:
  ```sh
  iwctl
  ```
  In the `iwctl` prompt:
  ```
  device list
  station <device> scan
  station <device> get-networks
  station <device> connect <SSID>
  ```
  Replace `<device>` with your wireless interface (e.g., wlan0), and `<SSID>` with your network name.

### 2. Start Arch Install

- Run the official installer:
  ```sh
  archinstall
  ```
- During the installation process:
  - When asked for "Additional packages," add the packages listed in `packages.json` to the additional packages field.

### 3. (Optional) Run Post-Install Script in Chroot Before Reboot

- If you want your network and services enabled on first boot, you can run the post-install script in a chroot before rebooting:
  ```sh
  arch-chroot /mnt
  cd /path/to/arch-bootstrap
  ./post-install.sh
  exit
  ```
- This ensures networking and services will be set up for your new system before your first reboot.

### 3. Reboot

- Once installation is complete, reboot into your new system:
  ```sh
  reboot
  ```

### 4. Initial Login & Repo Setup

- Log in as your user.
- Make sure you are connected to the internet (WiFi or ethernet).
- Clone this repository:
  ```sh
  git clone https://github.com/willy-kind/arch-bootstrap.git
  cd arch-bootstrap
  ```

### 5. (Optional) Run Post-Install Script

- Execute the post-install script to set up networking and other essentials:
  ```sh
  ./post-install.sh
  ```

### 6. Ensure age Key is Present
   
- To run the Ansible playbook and decrypt secrets, your **age private key** must be available.
- Without this key, the playbook will not be able to decrypt and restore your secrets.

### 7. Run Ansible Playbook

- Enter the ansible directory and run the playbook:
  ```sh
  cd ansible/
  ansible-playbook -i inventory.ini playbook.yaml -K
  ```

---

## Files

- `packages.json` — Package reference for additional packages in `archinstall`
- `post-install.sh` — Automated post-install setup
- `flake.nix` — Nix dev shell definition
- `playbook.yaml` — Ansible playbook
