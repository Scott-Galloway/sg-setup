#!/usr/bin/env bash
#Scott Galloway environment setup for admin

set -o erresit
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

exit 0
