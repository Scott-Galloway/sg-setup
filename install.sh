#!/usr/bin/env bash
#Scott Galloway environment setup

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__ROOT="$(cd "$(dirname "${__DIR}")" && pwd)"
__FILE="${__DIR}/$(basename "${BASH_SOURCE[0]}")"
__BASE="$(basename ${__FILE} .sh)"

#sudo apt-get -y install git screen vim curl dconf

#Run git config script
"${__DIR}"/git.sh

#replace .vim files
cp -r "${__DIR}"/vim/.vim/ ~/
cp -r "${__DIR}"/vim/.vimrc ~/

#Install pathogen for VIM

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim

#Install NERDTree for VIM
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

#setup screenrc
cp "${__DIR}"/screen/.screenrc ~/
cp "${__DIR}"/screen/.screenrc2 ~/

#load custom gnome-terminal profile 
#should check this later to make sure desktop is being run not server and gnome is the desk-env

#dconf load "$(__DIR)"/gnome-terminal-dconf.profile

cp "$(__DIR)"/.config/ ~/

exit 0
