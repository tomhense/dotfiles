# Firejail profile for neovide
# Description: Neovide is open source and freely distributable
# This file is overwritten after every install/update
# Persistent local customizations
include neovide.local
# Persistent global definitions
include globals.local

ignore blacklist ${RUNUSER}
noblacklist ${HOME}/.local/share/neovide
read-write ${HOME}/.local/share/neovide

# Redirect
include nvim.profile
