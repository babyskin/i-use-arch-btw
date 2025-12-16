# === Couleurs terminal & prompt ===
autoload -Uz colors && colors

# Prompt ciné gris pastel
PROMPT='%F{#d4a574}%n@%m %F{#d4a574}%~ %F{#d4a574}❯ %f'

export PATH="$HOME/.local/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# === Alias ===
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
# alias yay='yay --color'

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS="
  --color=fg:#CBE0F0,bg:#000000,hl:#d4a574 \
  --color=fg+:#CBE0F0,bg+:#4e7a68,hl+:#d4a574 \
  --color=info:#4e7a68,prompt:#d4a574,pointer:#d4a574,marker:#d4a574,spinner:#d4a574,header:#d4a574"

# fzf avec Ctrl+F
fzf-file-widget() {
  local selected_file
  selected_file=$(fzf)
  [[ -n "$selected_file" ]] && LBUFFER+="$selected_file"
}
zle -N fzf-file-widget
bindkey '^F' fzf-file-widget

# Fonction cd : va dans home si pas d’argument
function cd() {
  if [[ $# -gt 0 ]]; then
    builtin cd "$@"
  else
    builtin cd ~
  fi
}

# cdf pour changer de directory avec fzf
function cdf() {
  local dir
  dir=$(find . -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m)
  [[ -n "$dir" ]] && builtin cd "$dir"
}

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

export BAT_THEME="Catppuccin Macchiato"

bindkey '^E' end-of-line
bindkey '^A' beginning-of-line

bindkey '^[[3~' delete-char

alias pres='xclip -selection clipboard <'

alias packettracer='QT_QPA_PLATFORM=xcb /usr/lib/packettracer/packettracer.AppImage --no-sandbox'

zmodload zsh/complist
zstyle ':history-search-end' color 'fg=250,bg=238'
zle_highlight+=(region:fg=default,bg=237)

export FZF_DEFAULT_OPTS="
  --color=fg:#cbe0f0,bg:#2a2a2a,hl:#d4a574,fg+:#cbe0f0,bg+:#375a7f,hl+:#d4a574 \
  --color=info:#d4a574,prompt:#d4a574,pointer:#d4a574,marker:#d4a574,spinner:#d4a574,header:#d4a574"

export LS_COLORS="di=38;2;212;165;116:${LS_COLORS}"
