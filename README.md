# 🚀 Arch Bootstrap

> ⚠️ **Personal Setup:**  
> This is how I like to bootstrap my Arch Linux systems.  
> Feel free to use or adapt, but note that everything here is tailored to my own preferences and workflow.

---

## ⚡ My Installation Workflow

0. **Boot & Prepare (Live ISO)**
   - Boot from the Arch ISO USB.
   - Connect to WiFi using `iwctl`:
     ```sh
     iwctl
     # station <device> scan
     # station <device> get-networks
     # station <device> connect <SSID>
     ```
   - Install git in the live environment:
     ```sh
     pacman -Sy git
     ```
   - Clone this repo so my scripts are available:
     ```sh
     git clone https://github.com/willy-kind/arch-bootstrap.git
     cd arch-bootstrap
     ```
   - Use any scripts from the repo as needed during installation.

1. **Install Arch**
   - Use the official installer or Arch install tool.
   - When asked for "additional packages," refer to `packages.json` and add those packages manually.

2. **Run Post-Install Script**
   - After installation:
     ```sh
     ./post-install.sh
     ```

3. **Reboot**
   - Restart the machine.

4. **Connect to WiFi (iwctl only)**
   - After logging in, connect to WiFi again:
     ```sh
     iwctl
     # station <device> scan
     # station <device> get-networks
     # station <device> connect <SSID>
     ```

5. **Start Nix DevShell**
   - Enter the development shell:
     ```sh
     nix develop github:willy-kind/arch-bootstrap
     ```

6. **Clone This Repo (If Needed)**
   - If not already in the repo directory:
     ```sh
     git clone https://github.com/willy-kind/arch-bootstrap.git
     cd arch-bootstrap
     ```

7. **Run Ansible**
   - Run the playbook:
     ```sh
     ansible-playbook -i inventory.ini playbook.yml -K
     ```

---

## 📂 Files

- `packages.json` — Package reference
- `post-install.sh` — Automated post-install setup
- `flake.nix` — Nix dev shell definition
- `playbook.yml` — Ansible playbook

---

## 💡 Notes

- WiFi is always set up with `iwctl`—no alternatives!
