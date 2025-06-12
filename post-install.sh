#!/usr/bin/env bash
set -euo pipefail

echo "Enabling iwd, systemd-networkd, and systemd-resolved..."
systemctl enable --now iwd.service
systemctl enable --now systemd-networkd.service
systemctl enable --now systemd-resolved.service

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
