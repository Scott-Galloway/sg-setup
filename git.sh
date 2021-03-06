#!/usr/bin/env bash
#Git Setup
#Scott Galloway

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

#__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#__ROOT="$(cd "$(dirname "${__DIR}")" && pwd)"
#__FILE="${__DIR}/$(basename "${BASH_SOURCE[0]}")"
#__BASE="$(basename ${__FILE} .sh)"

##Setup Git variables

git config --global user.name "Scott Galloway"
git config --global user.email "gallowsa@gmail.com"
git config --global credential.helper cache
git config --global credential.helper 'cache timeout=3600'
git config --global push.default matching
git config --global core.editor 'vi -u ~/.vimrc_git'

exit 0
