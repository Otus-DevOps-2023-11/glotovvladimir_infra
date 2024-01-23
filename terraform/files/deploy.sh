#!/bin/bash
sudo rm -f /var/lib/apt/lists/lock
sudo rm -f /var/cache/apt/archives/lock
sudo rm -f /var/lib/dpkg/lock*
sudo dpkg --configure -a
set -e
APP_DIR=${1:-$HOME}
sudo apt-get install -y git
cd $APP_DIR
sudo rm -r -f reddit
git clone -b monolith https://github.com/express42/reddit.git
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
