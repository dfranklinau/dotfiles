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

# Load any custom bin scripts, such as `ack.
export PATH="$HOME/bin:$PATH"

# Load Neovim and define aliases. Use `\vim` to run Vim as normal.
# https://github.com/neovim/neovim
# Run `\vim` to ignore the alias and load Vim as normal.
export PATH="$HOME/.nvim/bin:$PATH"
alias vim="nvim"
alias vi="nvim"

# Load nodenv, a Node.js version manager, if it exists.
# https://github.com/nodenv/nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Include any local configuration.
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
