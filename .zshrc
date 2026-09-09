# Enable zsh plugins.
autoload -Uz colors

# Enable coloured output across the prompt and commands.
colors
alias ls="ls --color"

# Load Git prompt support.
source ~/git-prompt.sh

# Customise the zsh prompt.
GIT_PS1_SHOWCOLORHINTS=true
precmd () { __git_ps1 "%n :: %~" "$ " " (%s) " }

# Include any local configuration.
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
