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

BATTERY='%F{green}%B$(cat /sys/class/power_supply/BAT0/capacity)%%%b%f'

export PS1=''
PS1+='%B┌ %F{red}%(?..[%?] )%f%F{magenta}%n%f@%F{blue}%m%f %F{yellow}%d%f'
RPS1+=$BATTERY
PS1+=$'\n└%b » '

export LS_OPTS='--color=auto'
bindkey "^[[3~" delete-char

alias starwars='telnet towel.blinkenlights.nl'
