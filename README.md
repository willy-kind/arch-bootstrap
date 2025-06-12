# 🚀 Arch Bootstrap

> ⚠️ **Personal Setup:**  
> This repo is my personal Arch Linux bootstrap—feel free to peek, copy, or adapt, but it’s tailored for my preferences and workflow.

---

## ⚡ My Workflow

1. **Install Arch**  
   Use the official installer or Arch install tool.  
   When asked for "additional packages," check `packages.json` and add those packages manually.

2. **Run Post-Install Script**  
   After installation:
   ```sh
   ./post-install.sh
   ```

3. **Reboot**  
   Restart the machine.

4. **WiFi (iwctl only)**  
   After login, connect to Wifi:
   ```sh
   iwctl
   # station <device> scan
   # station <device> get-networks
   # station <device> connect <SSID>
   ```

5. **Nix DevShell**  
   Start the devShell:
   ```sh
   nix develop github:willy-kind/arch-bootstrap 
   ```

6. **Clone This Repo**  
   Clone the repo:
   ```sh
   git clone https://github.com/willy-kind/arch-bootstrap.git
   cd arch-bootstrap
   ```

7. **Run Ansible**  
   Run the playbook
   ```sh
   ansible-playbook -i inventory.ini playbook.yaml -K
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
