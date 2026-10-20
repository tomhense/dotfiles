# Firejail profile for Codex CLI
# Description: Allowlist-oriented Codex CLI development sandbox

quiet
include codex.local
include globals.local

hostname codex-sandbox

# Drop privileges and isolate IPC.
caps.drop all
ipc-namespace
nonewprivs
noroot
restrict-namespaces
#net enp12s0
#netfilter /etc/firejail/nolocal.net
#netfilter6 /etc/firejail/nolocal6.net

# Codex needs network access to the API.
protocol unix,inet,inet6

# CLI application.
#x11 none
dbus-user none
dbus-system none
noinput
nosound
noprinters
novideo

# Similar to bwrap --dev /dev and --tmpfs /tmp.
private-dev
private-tmp
private-cache

whitelist ${HOME}/.config/nvim
whitelist ${HOME}/.config/codex
whitelist ${HOME}/Android
whitelist ${HOME}/.local/share/gradle
whitelist ${HOME}/.local/share/uv
whitelist ${HOME}/.local/share/cargo

whitelist ${HOME}/.gitconfig
read-only ${HOME}/.gitconfig

# Optional syscall filtering. Enable after testing project tooling.
seccomp
