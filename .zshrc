# aliases
alias vi="nvim"
alias vim="nvim"

alias zed="zeditor"

alias ls="eza -l"
alias ll="eza -l"
alias la="eza -la"

# theme
eval "$(starship init zsh)"

# plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# bun completions
[ -s "/home/devgoat/.bun/_bun" ] && source "/home/devgoat/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# nvm
source /usr/share/nvm/init-nvm.sh
