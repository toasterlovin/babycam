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
