#!/bin/bash

addSofrwareToInstallIfNotInstalled() {
  local SOFTWARE=$1
  local PACKAGE=$2

  if brew ls --versions "$PACKAGE" >/dev/null; then
    echo ''
  else
    echo "${SOFTWARE} ${PACKAGE}"
  fi
}

command -v xcode-select >/dev/null 2>&1 || {
  echo >&2 "Installing xcode-select..."
  xcode-select --install
}

command -v brew >/dev/null 2>&1 || {
  echo >&2 "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

local software=""
local caskSoftware=""
software=$(addSofrwareToInstallIfNotInstalled "${software}" "zsh")
caskSoftware=$(addSofrwareToInstallIfNotInstalled "${caskSoftware}" "iterm2")

if [ -z "$software" ] && [ -z "$caskSoftware" ]; then
  echo "Nothing to install."
else
  brew update

  if [ -n "$software" ]; then
    echo "Installing $software"
    brew install"$software"
  fi

  if [ -n "$caskSoftware" ]; then
    echo "Installing cask ${caskSoftware}"
    brew cask install "${caskSoftware}"
  fi

  brew cleanup
  fi
}
