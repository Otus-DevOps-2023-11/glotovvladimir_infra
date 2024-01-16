#!/bin/sh
cd ~/. || exit
sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit || exit
bundle install
puma -d
ps aux | grep puma
