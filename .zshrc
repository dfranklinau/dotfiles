# Load zsh plugins:
# - `compinit` enables auto completion.
autoload -Uz compinit

# Enable coloured output across the prompt and commands.
alias ls="ls --color"

# Set up auto completion.
compinit

# Customise the zsh prompt.
source ~/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
RPROMPT="%F{cyan}%T%f"
precmd () { __git_ps1 "%B%F{cyan}%~%f%b" " $ " " (%s)" }

# Enable a shared history file for zsh.
HISTFILE=~/.zsh_history
HISTSIZE=10000 # The number of commands to save in memory.
SAVEHIST=10000 # The number of commands to save to a history file.
setopt SHARE_HISTORY

# Allow Up and Down arrows to traverse history when typing commands.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# Include any local configuration.
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
