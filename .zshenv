export VISUAL=nvim
export EDITOR=nvim
export MANWIDTH=425
export MANPAGER=nvimpager

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom
export KEYTIMEOUT=5
export ENABLE_CORRECTION=false
export ZSH_TMUX_AUTOREFRESH=true
export ZSH_TMUX_FIXTERM=true
# export ZSH_TMUX_AUTOSTART=true

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"
export FZF_DEFAULT_OPTS="--bind=ctrl-j:down,ctrl-k:up,ctrl-l:accept"
export TMUX_FZF_LAUNCH_KEY="C-f"


export AUTO_NOTIFY_THRESHOLD=10
export ANDROID_HOME=~/Android/Sdk

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
