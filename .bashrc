# Enable 256-color mode.
export TERM=xterm-256color

# Enable Git auto completion.
source ~/.git-completion.bash

# Enable the display of the current Git branch in the prompt.
source ~/.git-prompt.sh

# Load nodenv, a Node.js version manager, if it exists.
# https://github.com/nodenv/nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
if [ -x "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi

# Include any local commands.
if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi
