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
precmd () { __git_ps1 "%B%F{green}%n%f %F{cyan}%~%f%b" " $ " " (%s)" }

# Include any local configuration.
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
