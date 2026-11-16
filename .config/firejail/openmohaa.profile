
# Firejail profile for openmohaa
# Description: Open-source reimplementation of Medal of Honor: Allied Assault
# This file is overwritten after every install/update
# Persistent local customizations
include openmohaa.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/Games
noblacklist ${HOME}/.openmohaa

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-xdg.inc

mkdir ${HOME}/Games
mkdir ${HOME}/.openmohaa
whitelist ${HOME}/Games
whitelist ${HOME}/.openmohaa
include whitelist-common.inc
include whitelist-runuser-common.inc
include whitelist-usr-share-common.inc
include whitelist-var-common.inc

apparmor
caps.drop all
netfilter
nodvd
nogroups
noinput
nonewprivs
noroot
notv
nou2f
novideo
protocol unix,inet,inet6,netlink
seccomp

disable-mnt
private-bin openmohaa,launch_openmohaa_breakthrough,launch_openmohaa_base,launch_openmohaa_spearhead
private-cache
private-dev
private-etc @games,@x11
private-tmp

dbus-user none
dbus-system none

restrict-namespaces
