# 🚀 Arch Bootstrap

A fast, repeatable way to set up Arch Linux using manual package selection, post-install scripts, Nix, and Ansible.

## ⚡ Workflow

1. **Install Arch**  
   Use the official installer or Arch install tool.  
   When asked for "additional packages," open up `packages.json` and manually add those packages.

2. **Run Post-Install Script**  
   After installation, run:
   ```sh
   ./post-install.sh
   ```

3. **Reboot**  
   Give it a fresh start.

4. **Connect to WiFi (iwctl)**  
   After login, get online:
   ```sh
   iwctl
   # station <device> scan
   # station <device> get-networks
   # station <device> connect <SSID>
   ```
   (Replace `<device>` and `<SSID>` with your actual device and network name.)

5. **Enter Nix DevShell**  
   Set up your trusted dev environment:
   ```sh
   nix develop
   ```

6. **Clone This Repo**  
   If you’re not already here:
   ```sh
   git clone https://github.com/willy-kind/arch-bootstrap.git
   cd arch-bootstrap
   ```

7. **Run Ansible**  
   Apply your configuration magic:
   ```sh
   ansible-playbook playbook.yml
   ```

---

## 📂 Files

- `packages.json` — Your manual package reference
- `post-install.sh` — Automates your post-install setup
- `flake.nix` — Nix dev shell definition
- `playbook.yml` — Ansible playbook for system config

---

## 💡 Tips

- Keep `packages.json` up to date with your favorite essentials.
- Version control your scripts and configs—you’ll thank yourself later!
- WiFi setup is always via `iwctl` here.
- Make it your own! 🎨

---

Happy bootstrapping! 😄🐧
