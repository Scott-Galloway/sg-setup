#!/usr/bin/env bash
# Scott Galloway environment setup

#set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__ROOT="$(cd "$(dirname "${__DIR}")" && pwd)"
__FILE="${__DIR}/$(basename "${BASH_SOURCE[0]}")"
__BASE="$(basename ${__FILE} .sh)"

git --version > /dev/null 2>&1
git_exit="$(echo $?)"
curl -V > /dev/null 2>&1
curl_exit="$(echo $?)"
vim --version > /dev/null 2>&1
vim_exit="$(echo $?)"
screen -v > /dev/null 2>&1
screen_exit="$(echo $?)"

comb_exit="${git_exit}${curl_exit}${vim_exit}${screen_exit}"

if [ "${comb_exit}" -eq 0001 ]; then
    :
else    
    echo "Some pre-requisite is not installed. Check below for non-zero exit" \
        "code, correct the problem and try again."
    echo "git: ${git_exit}"
    echo "curl: ${curl_exit}"
    echo "vim: ${vim_exit}"
    echo "screen: ${screen_exit}"
    exit 1
fi

# Run git config script
"${__DIR}"/git.sh

# Replace .vim files
cp -r "${__DIR}"/vim/.vim/ ~/
cp -r "${__DIR}"/vim/.vimrc ~/

# Install pathogen for VIM

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim

# Install NERDTree for VIM
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

# Setup screenrc
cp "${__DIR}"/screen/.screenrc ~/
cp "${__DIR}"/screen/.screenrc2 ~/

#load custom gnome-terminal profile 
#should check this later to make sure desktop is being run not server and gnome is the desk-env

# Load Ubuntu Desktop sepcific configurations 
if [ "$(lsb_reslease -d)" = *"Ubuntu 15.10"* ]; then
    cp -r "${__DIR}"/.config/autostart/gnome-terminal.desktop ~/.config/autostart/gnome-terminal.desktop
    dconf load /org/gnome/terminal/legacy/profiles:/ "${__DIR}"/gnome-terminal-dconf.profile
elif [ "$(lsb_release -d)" = *"Ubuntu 14.04"* ]; then
    cp -r "${__DIR}"/.config/autostart/gnome-terminal.desktop ~/.config/autostart/gnome-terminal.desktop
    dconf load /org/gnome/terminal/legacy/profiles:/ "${__DIR}"/gnome-terminal-dconf.profile
else
    :
fi

exit 0
