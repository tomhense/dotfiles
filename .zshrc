#zmodload zsh/zprof

# Enable zsh directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Enable recursive globs (e.g. **.txt)
setopt GLOB_STAR_SHORT

# Enable completion
autoload -U compinit; compinit

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
#setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# Move to directories without cd
setopt AUTO_CD

# Use vim keybindings
bindkey -v

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

# Change cursor based on vim mode
source "$HOME/.config/zsh/plugins/zsh-cursor-mode/zsh-cursor-mode.zsh"

# Disable colors if we are in cool-retro-term
if [ -e "$COLORSCHEMES_DIR" ]; then
	export TERM='xterm-mono'
fi


# Pure zsh "lambda" style theme
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst

# Run vcs_info before displaying each prompt
add-zsh-hook precmd vcs_info

# --- vcs_info configuration ---
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:git*' actionformats '%b|%a'
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-staged

# Change indicators
zstyle ':vcs_info:git*' unstagedstr '%F{11}✗%f'
zstyle ':vcs_info:git*' stagedstr '%F{10}+%f'

if [ $(tput colors 2>/dev/null) -lt 8 ]; then
	PROMPT='%(?.%%.%%) %2~ '
	RPROMPT='$( [[ -n ${vcs_info_msg_0_} ]] && print -n "git:(${vcs_info_msg_0_})" )'
else
	PROMPT='%(?.%F{green}%%%f.%F{red}%%%f) %F{cyan}%2~%f '
	RPROMPT='$( [[ -n ${vcs_info_msg_0_} ]] && print -n "%F{blue}git:(%F{red}${vcs_info_msg_0_}%F{blue})%f" )'
fi


# Enable editing command in external command when in Normal mode and pressing v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Load aliases
source "$HOME/.aliases"

# Set up zoxide to move between folders efficiently
eval "$(zoxide init zsh)"

# Use mcfly for command history
export MCFLY_TIMEOUT=${MCFLY_TIMEOUT:-1m}
# Load McFly initialization, but inject timeout wrappers dynamically
eval "$(
  mcfly init zsh |
    awk -v t="$MCFLY_TIMEOUT" '
      /\$MCFLY_PATH/ {
        sub(/\$MCFLY_PATH/, "timeout " t " $MCFLY_PATH")
      }
      { print }
    '
)"


# ZSH Autosuggest
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [ $(tput colors 2>/dev/null) -ge 8 ]; then # Only load when we have color support
	# Load zsh-syntax-highlighting (must be loaded at the bottom)
	source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Tmux
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOQUIT=false

if [[ -z "$TMUX" && "$ZSH_TMUX_AUTOSTART" == "true" && -z "$VIM" && -z "$ZED_TERM" && "$TERM_PROGRAM" != 'vscode' ]]; then
	if [[ "$ZSH_TMUX_AUTOSTARTED" != "true" ]]; then
		export ZSH_TMUX_AUTOSTARTED=true
		command tmux attach || command tmux new

		if [[ "$ZSH_TMUX_AUTOQUIT" == "true" ]]; then
			exit
		fi
	fi
fi

#zprof
