plugins=(
  archlinux systemd snap #sudo #thefuck #gnu-utils 
  aliases alias-finder fast-syntax-highlighting #auto-notify #starship #zoxide
  zsh-navigation-tools #zsh-plugin-fd ##testing..these
  colorize command-not-found history
  fzf fzf-tab #fzf-tools zsh-fzf-utils
  copypath copyfile cp rsync
  gpg-agent ssh-agent keychain pass genpass
  extract universalarchive encode64
  jsontools isodate safe-paste cheatsheet
  urltools httpie nmap vscode
  globalias emoji themes
  terminitor npm npms nvm pip #asdf #virtualenv
  node python golang rust stripe
  mongo-atlas mongocli postgres redis-cli
  tmux #tmuxinator # kitty
  docker docker-compose lxd #toolbox
  gcloud heroku
  git gitignore git-extras #pre-commit
)
DEPENDENCES_ARCH+=( node@nodejs ) 

zstyle ':omz:update' mode auto
zstyle ':omz:update' verbosity default

zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' longer yes 
zstyle ':omz:plugins:alias-finder' exact yes 
zstyle ':omz:plugins:alias-finder' cheaper yes 

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':omz:plugins:nvm' lazy yes
# zstyle ':omz:plugins:nvm' eslint prettier typescript

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_eOLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

source $ZSH/oh-my-zsh.sh
source ~/.zsh/bindings.sh

autoload -Uz compinit
compinit

source /usr/share/doc/git-extras/git-extras-completion.zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# CTRL-T, CTRL-R, ALT-C fzf
# alias reloadz="omz relaod"
# alias cat="ccat"
# alias cp="cpv"
alias apcfix='sudo chown -R $(whoami) /opt/visual-studio-code'
alias discordupdate='pkill Discord && betterdiscordctl install && discord &'
alias cleardirty='sudo ntfsfix --clear-dirty'
alias path_add_node='PATH=$PATH:./node_modules/.bin/'
alias dispoff='xset dpms force off'
alias off='shutdown now'

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"
