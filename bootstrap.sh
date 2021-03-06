#! /usr/bin/env bash

# The Basics
apt-get update
apt-get install -y git vim tmux

# OpenCV Dependencies
apt-get install -y build-essential
apt-get install -y cmake unzip libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

# OpenCV
cd ~
wget -q https://github.com/Itseez/opencv/archive/3.1.0.zip
unzip 3.1.0.zip && rm 3.1.0.zip
cd opencv-3.1.0
mkdir build && cd build
cmake ..
make
make install
ldconfig
cd ~ && rm -rf opencv-3.1.0

# Webcam Permissions
chown root.video /dev/usb/video0
chmod g+rw /dev/v4l/video0
adduser vagrant video
