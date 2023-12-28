# Which plugins would you like to load?
plugins=(git common-aliases zsh-autosuggestions zsh-syntax-highlighting autojump \
zsh-tmux-rename tmux zsh-cursor-mode zsh-completions colorize colored-man-pages \
extract isodate pip copypath fzf bd)

# Activate certain plugins only when distro is arch
if [ "$DISTRO" = 'arch' ]; then plugins+=(archlinux); fi

# Which theme to choose (best: lambda, lambda-custom, simple)
ZSH_THEME="lambda-custom"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="false"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# tmux plugin options
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_UNICODE=true

# Disable loading of magic functions (disables url-quote-magic)
# Stop urls getting escaped when pasting them inside quotes but unfortunatly also when pasting them outside of quotes
DISABLE_MAGIC_FUNCTIONS=true 

# Enable zsh directory stack
alias d='dirs -v'
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Enable recursive globs (e.g. **.txt)
setopt globstarshort

# Enable completion
autoload -U compinit; compinit

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt appendhistory
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
#setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
#setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
#setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
#setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
#setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.

# Load oh-my-zsh (position of this line in .zshrc is not arbitary)
source $ZSH/oh-my-zsh.sh

# Use vim keybindings
bindkey -v
export KEYTIMEOUT=1

# Further keybindgs
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable C-w vim keybinding
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-/\\ '

# Enable c-i-" vim style keybinding
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
	bindkey -M $km -- '-' vi-up-line-or-history
	for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
		bindkey -M $km $c select-quoted
	done
	for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
		bindkey -M $km $c select-bracketed
	done
done

# Enable editing command in external command when in Normal mode and pressing v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Use mcfly for command history
eval "$(mcfly init zsh)"

source "$HOME/.aliases"

# Enable auto darkmode when using konsole
konsole-auto-darkmode() {
	if [ "$KONSOLE_DBUS_WINDOW" ]; then
		if [ "$(detect-darkmode)" = 'light' ]; then
			konsoleprofile Colorscheme=BlackOnWhiteFixed
			export MCFLY_LIGHT=TRUE
		else
			konsoleprofile Colorscheme=MonokaiKonsole
			export MCFLY_LIGHT=FALSE
		fi
	fi
}
konsole-auto-darkmode

