# Use the Vim installed by Homebrew.
alias vim='/usr/local/bin/vim'

# Enable Git auto completion.
source ~/.git-completion.bash

# Enable the display of the current Git branch in the prompt.
# [1] - Will change the prompt to read user@host:folder (branch)$
source ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "' # [1]
