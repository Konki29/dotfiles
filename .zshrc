[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Added by Antigravity
export PATH="/Users/konki/.antigravity/antigravity/bin:$PATH"

# Inicializar Starship
eval "$(starship init zsh)"

# Inicializar Zoxide (reemplazo de cd)
eval "$(zoxide init zsh)"

# Inicializar FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Tus propios Atajos (Aliases)
alias gs="git status"
alias ..="cd .."
alias gcli="gemini --chat" # Si instalas el CLI de Gemini más adelante