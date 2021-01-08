#!/usr/bin/env zsh

export EDITOR='code --wait';
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

export PYTHONIOENCODING='UTF-8';

# History file
export HISTSIZE='65535';
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL='ignoreboth';

# Locale
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Man pages
export MANPAGER='less -XF';
# Highlight section titles
export LESS_TERMCAP_md="${yellow}";

command -v go > /dev/null 2>&1 && {
  export GOPATH=~/.godir
  export PATH="$PATH:$GOPATH/bin"
}

command -v npm > /dev/null 2>&1 && {
  export PATH="$PATH:$HOME/.npm/bin"
  export NPM_CONFIG_PREFIX="$HOME/.npm"
}

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH=$PATH:$HOME/.local/bin
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
