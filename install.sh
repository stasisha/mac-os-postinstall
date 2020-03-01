#!/bin/bash

source /dev/stdin <<< "$(curl --insecure https://raw.githubusercontent.com/stasisha/bash-utils/master/brew.sh)";

local software=""
local caskSoftware=""
software=$(addSofrwareToInstallIfNotInstalled "${software}" "zsh")
caskSoftware=$(addSofrwareToInstallIfNotInstalled "${caskSoftware}" "iterm2")

brew-install "$software" "$caskSoftware"
