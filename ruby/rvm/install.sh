#!/usr/bin/env bash
#Scott Galloway RVM installation script

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

cd ~/Downloads/

curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc

gpg --verify rvm-installer.asc  && bash rvm-installer stable --ruby

exit 0
