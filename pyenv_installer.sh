#!/bin/bash

# This Script Will Install PYENV in Kali Linux

# Colour Codes
BLUE='\033[0;34m'
PURPLE='\033[1;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Text Styles
bold=$(tput bold)
normal=$(tput sgr0)



# Check if pyenv is already installed
set -e
[ -n "$PYENV_DEBUG" ] && set -x

if [ -z "$PYENV_ROOT" ]; then
  PYENV_ROOT="${HOME}/.pyenv"
fi

# Checks for `.pyenv` file, and suggests to remove it for installing
if [ -d "${PYENV_ROOT}" ]; then
  {
    printf "${RED}${bold}"
    echo "Can not proceed with installation. Kindly remove the '${PYENV_ROOT}' directory first"
  } >&2
    exit 1
fi

# Clone Repository
printf "${GREEN}${bold}" 
echo "[1] Cloning Repository"
printf "${NC}${normal}"
git clone "https://github.com/pyenv/pyenv.git" "${PYENV_ROOT}" # clone pyenv
printf "${BLUE}${bold}" 
echo "[*] Done"

# Define environment variable PYENV_ROOT
printf "${GREEN}${bold}" 
echo "[2] Configuring Environment Variable PYENV_ROOT"
echo "export PYENV_ROOT=\"\${HOME}/.pyenv\"" >>~/.bashrc
echo "export PATH=\"\${PYENV_ROOT}/bin:\$PATH\"" >>~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >>~/.bashrc
printf "${BLUE}${bold}" 
echo "[*] Done"

# Make sure to follow this guidance for your platform before any troubleshooting. - https://github.com/pyenv/pyenv/wiki/common-build-problems
printf "\n${GREEN}${bold}" 
echo "[3] Installing Additional Packages To Avoid Common Build Problems"
printf "${NC}${normal}"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y make build-essential libssl1.0-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
printf "${BLUE}${bold}" 
echo "[*] Done"

# Install Python 2.7.4 Version
printf "\n${GREEN}${bold}" 
echo "[4] Installing Python 2.7.4"
printf "${NC}${normal}"
pyenv install 3.7.3
printf "${BLUE}${bold}" 
echo "[*] Done"

# Install Python 3.7.3 Version
printf "\n${GREEN}${bold}" 
echo "[4] Installing Python 3.7.3"
printf "${NC}${normal}"
pyenv install 3.7.3
printf "${BLUE}${bold}" 
echo "[*] Done"
