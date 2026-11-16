# Firejail profile for openQ4
# Description: Quake 4 source port/client
# This file is overwritten after every install/update
# Persistent local customizations
include openq4.local
# Persistent global definitions
include globals.local

# The client is normally launched from the directory containing
# openQ4-client_x64.  The game data is kept in the normal Steam directory;
# pass the corresponding fs_basepath and fs_savepath arguments when launching
# the client (see the usage example below).

noblacklist ${HOME}/.local/share/Steam

include disable-common.inc
include disable-devel.inc
include disable-interpreters.inc
include disable-proc.inc
include disable-programs.inc
#include disable-shell.inc
include disable-xdg.inc

# Keep the installed game files immutable inside the sandbox.  The save
# directory is deliberately the real XDG data directory, rather than an
# artificial /save mount.  If XDG_DATA_HOME is set, put the matching
# whitelist in openq4.local.
mkdir ${HOME}/Games
whitelist ${HOME}/Games
whitelist ${HOME}/.local/share/Steam/steamapps/common/Quake 4
read-only ${HOME}/.local/share/Steam/steamapps/common/Quake 4
mkdir ${HOME}/.local/share/quake4
whitelist ${HOME}/.local/share/quake4
include whitelist-common.inc
include whitelist-runuser-common.inc
include whitelist-usr-share-common.inc
include whitelist-var-common.inc

apparmor
caps.drop all
ipc-namespace
machine-id
net none
nodvd
nogroups
noinput
nonewprivs
noroot
notv
nou2f
novideo
protocol unix
seccomp
seccomp.block-secondary

disable-mnt
private-cache
private-dev
#private-etc @games,@tls-ca,@x11,alsa,fonts,glvnd,hosts,localtime,machine-id,nsswitch.conf,passwd,group,resolv.conf,timezone,vulkan
private-tmp

dbus-user none
dbus-system none

memory-deny-write-execute
restrict-namespaces

# Example:
# firejail --profile=openq4 ./openQ4-client_x64 \
#   +set fs_basepath "$HOME/.local/share/Steam/steamapps/common/Quake 4" \
#   +set fs_savepath "${XDG_DATA_HOME:-$HOME/.local/share}"
