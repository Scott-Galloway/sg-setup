#!/usr/bin/env bash
# Firewall setup

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

#__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#__ROOT="$(cd "$(dirname "${__DIR}")" && pwd)"
#__FILE="${__DIR}/$(basename "${BASH_SOURCE[0]}")"
#__BASE="$(basename ${__FILE} .sh)"

apt-get install ipset

sudo ipset create blacklist hash:ip hashsize 4096 maxelem 1048576


