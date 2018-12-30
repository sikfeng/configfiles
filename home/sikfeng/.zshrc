setopt histignorealldups sharehistory PROMPT_SUBST

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
zstyle :compinstall filename '/home/sikfeng/.zshrc'
autoload -Uz compinit
compinit

eval "$(dircolors -b)"
# End of lines added by compinstall

tput smkx

export LS_OPTS='--color=auto'
bindkey "^[[3~" delete-char

alias starwars='telnet towel.blinkenlights.nl'

export GPG_TTY=$(tty)

# zsh prompt
export PS1=''
function precmd {
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))
  local USERHOSTSIZE=${#${(%):-%n@%m}}
  local ERRORSIZE=${#${(%):-%(?..[%?] )}}
  local DIRSIZE=${#${(%):-%d}}
  DIRLEN=""
  #if [[ "$USERHOSTSIZE" + "$ERRORSIZE" + "$DIRSIZE" + 3 -gt "$TERMWIDTH" ]]; then
  #  (( DIRLEN=$TERMWIDTH - ("$USERHOSTSIZE" + "$ERRORSIZE" + "$DIRSIZE" + 3) ))
  #fi
}
PS1+='%B┌ %F{red}%(?..[%?] )%f%F{magenta}%n%f@%F{blue}%m%f %F{yellow}%d%f'
PS1+=$'\n└%b » '

