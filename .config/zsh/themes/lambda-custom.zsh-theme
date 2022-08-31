GREEK_SYMBOLS='αβγΓδΔλμπσΣϒΦΨΩ'
CHAR="${GREEK_SYMBOLS:$(( RANDOM % ${#GREEK_SYMBOLS} )):1}"

#PROMPT='$CHAR %~/ $(git_prompt_info)%{$reset_color%}'
PROMPT='$CHAR %25<...<%~%<</ $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
