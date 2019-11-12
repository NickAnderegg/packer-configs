#!/usr/bin/env bash

# Rewrite the interfaces file more cleanly
sudo bash -c "cat >/etc/network/interfaces" <<EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug eth0
iface eth0 inet dhcp

# The secondary network interface (if present)
allow-hotplug eth1
iface eth1 inet dhcp
EOF
