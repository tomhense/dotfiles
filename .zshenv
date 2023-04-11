# Set XDG variables (because some applications to not use proper fallbacks)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
#export XDG_RUNTIME_DIR=

# Zsh
export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"
export ZSH_CUSTOM="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
if [ -f /etc/os-release ]; then
	export DISTRO="$(awk -F'=' '/^ID/ { print $2 }' /etc/os-release)"
fi

# Perl
if [ -d ~/perl5 ]; then
	export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
	export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
	export PERL_MB_OPT="--install_base \"$HOME/perl5\""
	export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
	export PATH="$PATH:$HOME/perl5/bin"
fi

# NPM
NPM_PACKAGES="${XDG_DATA_HOME:-$HOME/.local/share}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Path
export PATH="$HOME/.local/bin:$HOME/scripts:$HOME/.cargo/bin:$NPM_PACKAGES/bin:/opt/cuda/bin:/usr/bin/sbin:$PATH"

# Java options
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

# Firefox
export MOZ_ENABLE_WAYLAND=1
#export MOZ_USE_XINPUT2=1 # Enhance touchpad scrolling on X11

# Plasma options
#export GDK_DPI_SCALE=1.25
#export PLASMA_USE_QT_SCALING=1 # For 4K monitor
export GTK_USE_PORTAL=1 # Needs xdg-portal-kde package to work
#export __GL_MaxFramesAllowed=1 # Fix tearing
#export QT_AUTO_SCREEN_SCALE_FACTOR=1 # Fix sizing problems

# Expermimental Qt highdpi options (>=Qt 6.4)
#export QT_WIDGETS_HIGHDPI_DOWNSCALE=1
#export QT_WIDGETS_RHI=1

# Editor
export VISUAL=nvim
export EDITOR=nvim

# Other
export MOZ_PLUGIN_PATH="/usr/lib/mozilla/plugins"
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.sock
export WLR_NO_HARDWARE_CURSORS=1

# Force XDG conventions
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export VSCODE_PORTABLE="${XDG_DATA_HOME:-$HOME/.local/share}/vscode"
#export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtkrc-2.0"
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/gradle"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/nv"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export TEXMFHOME="${XDG_DATA_HOME:-$HOME/.local/share}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME:-$HOME/.cache}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/texlive/texmf-config"

