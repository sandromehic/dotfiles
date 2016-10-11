#autoload -Uz compinit promptinit
#compinit
#promptinit

# menu select
#zstyle ':completion:*' menu select
#setopt COMPLETE_ALIASES

source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# aliases
alias cgit='/usr/bin/git --git-dir=$HOME/.cgit/ --work-tree=$HOME'
