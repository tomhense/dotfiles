# Firejail profile for umu
# Persistent local customizations
include umu.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.local/share/umu
noblacklist ${HOME}/.local/share/Steam
noblacklist ${HOME}/Games

# needed for STEAM_RUNTIME_PREFER_HOST_LIBRARIES=1 to work
noblacklist /sbin
noblacklist /usr/sbin

# Allow java (blacklisted by disable-devel.inc)
include allow-java.inc

# Allow python (blacklisted by disable-interpreters.inc)
include allow-python2.inc
include allow-python3.inc

include disable-common.inc
include disable-devel.inc
include disable-interpreters.inc
include disable-programs.inc

whitelist ${HOME}/.local/share/Steam/steamapps/compatdata
whitelist ${HOME}/.local/share/Steam/compatibilitytools.d
whitelist ${HOME}/.local/share/umu
whitelist ${HOME}/.cache/umu
whitelist ${HOME}/.cache/umu-protonfixes
whitelist ${HOME}/Games

include whitelist-common.inc
include whitelist-var-common.inc

keep-dev-ntsync

caps.drop all
#ipc-namespace
netfilter
nodvd
nogroups
nonewprivs
noroot
notv
#nou2f # may break gamepads in certain games (see #6523)
# To allow VR and camera-based motion tracking, add 'ignore novideo' to your
# steam.local.
novideo
protocol unix,inet,inet6,netlink
# seccomp sometimes causes issues (see #2951, #3267).
# Add 'ignore seccomp' to your steam.local if you experience this.
# mount, name_to_handle_at, pivot_root and umount2 are used by Proton >= 5.13
# (see #4366).
seccomp !chroot,!mount,!name_to_handle_at,!pivot_root,!process_vm_readv,!ptrace,!umount2,!mount_setattr,!process_vm_writev
# process_vm_readv is used by GE-Proton7-18 (see #5185).
seccomp.32 !process_vm_readv,!process_vm_writev
# tracelog breaks integrated browser
#tracelog

# private-bin is disabled while in testing, but is known to work with multiple games.
# Add the next line to your steam.local to enable private-bin.
#private-bin awk,basename,bash,bsdtar,bzip2,cat,chmod,cksum,cmp,comm,compress,cp,curl,cut,date,dbus-launch,dbus-send,desktop-file-edit,desktop-file-install,desktop-file-validate,dirname,echo,env,expr,file,find,getopt,grep,gtar,gzip,head,hostname,id,lbzip2,ldconfig,ldd,ln,ls,lsb_release,lsof,lspci,lz4,lzip,lzma,lzop,md5sum,mkdir,mktemp,mv,netstat,ps,pulseaudio,python*,readlink,realpath,rm,sed,sh,sha1sum,sha256sum,sha512sum,sleep,sort,steam,steamdeps,steam-native,steam-runtime,sum,tail,tar,tclsh,test,touch,tr,umask,uname,update-desktop-database,wc,wget,wget2,which,whoami,xterm,xz,zenity
# Extra programs are available which might be needed for select games.
# Add the next line to your steam.local to enable support for these programs.
#private-bin java,java-config,mono
# To view screenshots add the next line to your steam.local.
#private-bin eog,eom,gthumb,pix,viewnior,xviewer

private-dev
# private-etc breaks a small selection of games on some systems. Add 'ignore private-etc'
# to your steam.local to support those.
private-etc @games,@tls-ca,@x11,bumblebee,dbus-1,host.conf,lsb-release,mime.types,os-release,services
private-tmp

dbus-user none
dbus-system none

#restrict-namespaces
