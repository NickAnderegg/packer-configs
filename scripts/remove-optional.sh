#!/usr/bin/env bash

# Mark everything that was installed as part of a metapackage as being auto installed
sudo apt-mark minimize-manual

# Mark the most important packages as being manually installed
sudo apt-mark manual \
    openssh-server \
    sudo \
    apt-utils \
    debian-archive-keyring \
    fdisk \
    gpgv \
    init \
    nano \
    netbase \
    sensible-utils \
    systemd \
    systemd-sysv \
    tasksel \
    tasksel-data \
    bzip2 \
    netcat-traditional \
    dbus \
    apparmor

# Autoremove everything that was automatically installed
sudo apt-get -y \
    -o "APT::Install-Recommends=false" \
    -o "APT::Install-Suggests=false" \
    -o "APT::AutoRemove::RecommendsImportant=false" \
    -o "APT::AutoRemove::SuggestsImportant=false" \
    autoremove

# Clear caches and cleanup
sudo apt-get clean
sudo apt-get autoclean

# Clear unneeded caches and log files
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /var/log/installer/
