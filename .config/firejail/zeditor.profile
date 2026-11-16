# Firejail profile for zeditor
# Description: Code editor for software developers
# This file is overwritten after every install/update
# Persistent local customizations
include zeditor.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.cache/zed
noblacklist ${HOME}/.config/zed
noblacklist ${HOME}/.local/share/zed

# Allows files commonly used by IDEs
include allow-common-devel.inc

include disable-common.inc
include disable-programs.inc

include whitelist-runuser-common.inc

caps.drop all
nonewprivs
noroot
protocol unix,inet,inet6
seccomp
private-etc @tls-ca,@x11

dbus-user none
dbus-system none
