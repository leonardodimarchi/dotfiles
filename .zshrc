# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/Android/Sdk/platform-tools:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export CHROME_EXECUTABLE=chromium
export CHROME_BIN=chromium
export EDITOR='lvim'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

zstyle ':completion:*:*:git:*' script ~/.zsh/functions/git-completion.bash
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit

source /opt/asdf-vm/asdf.sh
export FLUTTER_ROOT="$(asdf where flutter)"

alias cat="bat --style=auto"
alias ls="exa --icons"
alias mux="tmuxinator"

. ~/.asdf/plugins/java/set-java-home.zsh
. ~/.asdf/plugins/golang/set-env.zsh

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest:$PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools:$PATH

export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037

export CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/android-studio
