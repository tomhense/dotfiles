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

# Order of noblacklist,include,whitelist sections matters!
noblacklist ${HOME}/Documents
noblacklist ${HOME}/.config/nvim
noblacklist ${HOME}/.config/codex
noblacklist ${HOME}/Android
noblacklist ${HOME}/.local/share/gradle
noblacklist ${HOME}/.local/share/uv
noblacklist ${HOME}/.local/share/cargo
noblacklist ${HOME}/.gitconfig

blacklist ${RUNUSER}
include disable-common.inc
include disable-devel.inc
include disable-programs.inc
include disable-xdg.inc
include disable-proc.inc

whitelist ${HOME}/.config/nvim
whitelist ${HOME}/.config/codex
whitelist ${HOME}/Android
whitelist ${HOME}/.local/share/gradle
whitelist ${HOME}/.local/share/uv
whitelist ${HOME}/.local/share/cargo
whitelist ${HOME}/.ansible
whitelist ${HOME}/.gitconfig

read-only ${HOME}/.gitconfig

#private-bin codex,bash,sh,git,env,dirname,basename,readlink,find,grep,sed,awk,cat,cp,mv,rm,mkdir,tee,head,tail,wc,sort,tar,gzip,unzip,curl,python3,node,npm,uv,rustc,rustfmt,xz,zstd,rg,ls,stat

seccomp
restrict-namespaces
