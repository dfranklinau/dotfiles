# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh theme.
ZSH_THEME="robbyrussell"

# oh-my-zsh settings.
CASE_SENSITIVE=true

# oh-my-zsh plugins.
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Load Git prompt support.
source ~/git-prompt.sh

# Customise the zsh prompt.
precmd () { __git_ps1 "~ %{$fg_bold[green]%}%n%{$reset_color%} %{$fg_bold[blue]%}git:(%{$reset_color%}" "%{$fg_bold[blue]%})%{$reset_color%} :: %{$fg_bold[cyan]%}%~%{$reset_color%} $ " "%s" }
GIT_PS1_SHOWCOLORHINTS=true

# Load any local scripts and/or overrides, such as `ack` or `vim`.
export PATH="$HOME/local/bin:$PATH"

# Load nodenv, a Node.js version manager, if it exists.
# https://github.com/nodenv/nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Include any local configuration.
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
