#! /usr/bin/env bash

# The Basics
apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y vim

# Clojure
apt-get install -y default-jdk
cd /usr/local/bin
wget -q https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod a+x lein
sudo -u vagrant lein

# OpenCV
apt-get install -y unzip
apt-get install -y cmake
apt-get install -y ant
su vagrant <<AS_VAGRANT
  cd ~
  mkdir opt && cd opt
  wget -q https://github.com/Itseez/opencv/archive/3.0.0.zip
  unzip 3.0.0.zip && rm 3.0.0.zip
  cd opencv-3.0.0/
  mkdir build && cd build
  cmake -DBUILD_SHARED_LIBS=OFF ..
  make -j8
  cd ~/opt
  mkdir clj-opencv/ && cd clj-opencv
  cp ~/opt/opencv-3.0.0/build/bin/opencv-300.jar .
  mkdir -p native/linux/x86_64
  cp ~/opt/opencv-3.0.0/build/lib/libopencv_java300.so native/linux/x86_64
  jar -cMf opencv-native-300.jar native
  cd /vagrant
  lein localrepo install /home/vagrant/opt/clj-opencv/opencv-300.jar opencv/opencv 3.0.0
  lein localrepo install /home/vagrant/opt/clj-opencv/opencv-native-300.jar opencv/opencv-native 3.0.0
AS_VAGRANT
