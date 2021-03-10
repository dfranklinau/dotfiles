# Enable 256-color mode.
export TERM=xterm-256color

# Enable Git auto completion.
source ~/.git-completion.bash

# Enable the display of the current Git branch in the prompt.
source ~/.git-prompt.sh

# Modify the prompt command to include the current Git branch. The if
# statement determines whether or not to use Apple_Terminal specific code.
if [ "$TERM_PROGRAM" = 'Apple_Terminal' ]; then
  export PROMPT_COMMAND="$PROMPT_COMMAND; __git_ps1 '\W' '\\\$ '"
else
  export PROMPT_COMMAND="$PROMPT_COMMAND __git_ps1 '\W' '\\\$ '"
fi

# Load nodenv, a Node.js version manager, if it exists.
# https://github.com/nodenv/nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
if [ -x "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi

# Run macOS-specific commands.
if [[ "$(uname -s)" == 'Darwin' ]]; then

  # Use the Vim installed by Homebrew.
  alias vim='/usr/local/bin/vim'

  # Enable bash-completion, installed via Homebrew.
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  fi

fi

# Include any local bashrc commands.
source ~/.bashrc-extends
