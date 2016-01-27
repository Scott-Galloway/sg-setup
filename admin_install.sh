#!/usr/bin/env bash
#Scott Galloway environment setup for admin

set -o erresit
set -o nounset
set -o pipefail
# set -o xtrace

ub_ver="$(echo "$(uname -v)" | grep -i ubuntu > /dev/null 2>&1;\
    echo $?)" 
deb_ver="$(echo "$(uname -v)" | grep -i debian > /dev/null 2>&1;\
    echo $?)"
cen_ver="$(echo "$(uname -v)" | grep -i centos > /dev/null 2>&1;\
    echo $?)"
rhel_ver="$(echo "$(uname -v)" | grep -i "redhat

if [ 
