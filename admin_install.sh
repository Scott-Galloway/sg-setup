#!/usr/bin/env bash
#Scott Galloway environment setup for admin

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

ub_ver="$(lsb_release -d | awk -F: '{print $2}')" 
#deb_ver="$(echo "$(uname -v)" | grep -i debian > /dev/null 2>&1;\
 #   echo $?)"
#cen_ver="$(echo "$(uname -v)" | grep -i centos > /dev/null 2>&1;\
 #   echo $?)"
#rhel_ver="$(echo "$(uname -v)" | grep -i enterprise > /dev/null\
 #   2>&1; echo $?)"

if [[ "${ub_ver}" == *"Ubuntu"* ]]; then

    add-apt-repository ppa:git-core/ppa
    apt-get update
    apt-get -y install curl git vim screen shellcheck

else
    echo "Unknown distribution, fix and re-code."
    exit 1
fi

tar -xvf VMware CLI tools

install VMware CLI Tools
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0:i386 gcc-multilib \
    build-essential gcc uuid uuid-dev perl libssl-dev perl-doc liburi-perl \
    libxml-libxml-perl libcrypt-ssleay-perl

exit 0
