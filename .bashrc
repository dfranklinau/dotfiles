# Use the Vim installed by Homebrew.
alias vim='/usr/local/bin/vim'

# Use the Emacs installed by Homebrew.
alias emacs='/usr/local/Cellar/emacs/25.2/Emacs.app/Contents/MacOS/Emacs -nw'

# Enable 256-color mode.
export TERM=xterm-256color

# Enable Git auto completion.
source ~/.git-completion.bash

# Enable the display of the current Git branch in the prompt.
source ~/.git-prompt.sh

# Modify the prompt command to include the current Git branch. And if
# statement determines whether or not to use Apple_Terminal specific code.
if [ $TERM_PROGRAM = 'Apple_Terminal' ]; then
	export PROMPT_COMMAND="$PROMPT_COMMAND; __git_ps1 '\u@\h:\W' '\\\$ '" # [1]
else
	export PROMPT_COMMAND="$PROMPT_COMMAND __git_ps1 '\u@\h:\W' '\\\$ '" # [1]
fi
