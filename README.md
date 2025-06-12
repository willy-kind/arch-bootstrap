# Arch Bootstrap

> ⚠️ **Personal Setup:**  
> This is how I like to bootstrap my laptop.  

---

## Installation Workflow

0. **Boot & Prepare (Live ISO)**
   - Boot from the Arch ISO USB.
   - Connect to WiFi using `iwctl`:
     ```sh
     iwctl
     ```
   - Install git in the live environment:
     ```sh
     pacman -S git
     ```
   - Clone this repo so my scripts are available:
     ```sh
     git clone https://github.com/willy-kind/arch-bootstrap.git
     cd arch-bootstrap
     ```

1. **Install Arch**
   - Run the official archinstall and complete the steps.
     ```sh
      archinstall
     ```
   - When asked for "additional packages," refer to `packages.json` and add those packages manually.
     
2. **Run Post-Install Script**
   - After installation:
     ```sh
     arch-bootstrap/post-install.sh
     ```

3. **Reboot**

4. **Connect to WiFi (iwctl only)**
   - After logging in, connect to WiFi again:
     ```sh
     iwctl
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
     cd ansible/
     ansible-playbook -i inventory.ini playbook.yml -K
     ```

---

## Files

- `packages.json` — Package reference
- `post-install.sh` — Automated post-install setup
- `flake.nix` — Nix dev shell definition
- `playbook.yml` — Ansible playbook
