source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  git
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  docker
  docker-compose
  mix
  vi-mode
  asdf
  kubectl
  globalias
  agkozak/zsh-z
EOBUNDLES

antigen theme iplaces/astro-zsh-theme

antigen apply

autoload -Uz compinit bashcompinit
compinit
bashcompinit

bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# cleanup utilities
alias cc="sudo -E cacheclean 2"
alias bb="sudo -E bleachbit --clean system.cache system.localizations system.trash system.tmp deepscan.backup deepscan.ds_store deepscan.thumbs_db deepscan.tmp google_chrome.cache google_chrome.cookies google_chrome.dom google_chrome.form_history google_chrome.history google_chrome.passwords google_chrome.search_engines google_chrome.session google_chrome.sync google_chrome.vacuum"

alias df1='df --type btrfs --type ext4 --type ext3 --type ext2 --type vfat --type iso9660'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g J='| jq "."'
alias -g L='| less'
alias -g X='| xmllint --format -'
alias h='history'
alias dc='docker-compose'
alias dcl='docker-compose logs --follow'
alias dcr='docker-compose run --rm'
alias dcre='docker-compose stop && docker-compose up -d'
alias l='exa'
alias ll='exa -lgh --git'
alias la='exa -lgha --git'
alias glg='git lg'

# don't allow tmux renaming of windows
DISABLE_AUTO_TITLE="true"

# iex shell history
ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
# build erlang documentation when installing with asdf
export KERL_BUILD_DOCS=yes

# emacs doom
export PATH=~/.emacs.d/bin:$PATH
export PATH=~/.elixir-ls/release/:$PATH

# shell powerups
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh

# ssh agent as a service
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# kubectl autocompletion
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi


# driftrock
alias ssh_buildkite='gcloud beta compute --project "platform-156214" ssh --zone "us-central1-a" "buildkite-agent-blue-1"'

source /home/sandro/projects/driftrock/dev-environment/.env
source /home/sandro/projects/driftrock/dev-environment/.devenv
source /home/sandro/projects/driftrock/dev-environment/lib/driftrock-completion
export PATH=$PATH:/home/sandro/projects/driftrock/dev-environment

# ruby gem home
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
