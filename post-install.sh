#!/bin/bash
set -e

# Ensure iwd is installed
if ! pacman -Q iwd >/dev/null 2>&1; then
  echo "Installing iwd..."
  pacman -Sy --noconfirm iwd
fi

# Enable and start systemd-networkd, systemd-resolved, and iwd
echo "Enabling and starting systemd-networkd, systemd-resolved, and iwd..."
systemctl enable --now systemd-networkd
systemctl enable --now systemd-resolved
systemctl enable --now iwd

# Symlink /etc/resolv.conf for systemd-resolved
echo "Setting up /etc/resolv.conf for systemd-resolved..."
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Create a systemd-networkd config for wireless interfaces
cat <<EOF >/etc/systemd/network/25-wireless.network
[Match]
Type=wlan0

[Network]
DHCP=yes
EOF

echo "Setup complete!"
echo "After reboot, use 'iwctl' to scan and connect to WiFi."
echo "systemd-networkd will automatically manage the connection and DHCP."
