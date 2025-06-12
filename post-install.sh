#!/usr/bin/env bash
set -euo pipefail

echo "Enabling nix, iwd, systemd-networkd, and systemd-resolved..."
systemctl enable --now nix-daemon.service
systemctl enable --now iwd.service
systemctl enable --now systemd-networkd.service
systemctl enable --now systemd-resolved.service

echo "Add user to nix-users and source nix profile for bash"
USERNAME=$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1; exit}' /etc/passwd)
USER_HOME=$(eval echo "~$USERNAME")
usermod -aG nix-users "$USERNAME"
if ! grep -q '/etc/profile.d/nix.sh' "$USER_HOME/.bashrc"; then
  echo '. /etc/profile.d/nix.sh' >> "$USER_HOME/.bashrc"
fi
chown "$USERNAME":"$USERNAME" "$USER_HOME/.bashrc"

echo "Linking /etc/resolv.conf to systemd-resolved's stub resolver..."
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo "Setting up systemd-networkd for WiFi interface: wlan0"
cat <<EOF > /etc/systemd/network/25-wireless.network
[Match]
Name=wlan0

[Network]
DHCP=yes
EOF

echo "Setup complete! Use 'iwctl' to connect to WiFi if needed."
