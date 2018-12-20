# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# export some things before loading plugins
# export ZSH_TMUX_AUTOSTART=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup
plugins=(git npm vi-mode autojump history-substring-search aws kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration
UNAME=$(/usr/bin/env uname)
if [ $UNAME = "Darwin" ]; then
	export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
else # Everyone else (Linux)
	export PATH="$PATH:$HOME/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
	export TERM=xterm-256color

	# set up aliases for pacman
	alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
	alias pacdl='pacman -Sw'		# Download specified package(s) as .tar.xz ball
	alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
	alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
	alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
	alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
	alias pacrep='pacman -Si'		# Display information about a given package in the repositories
	alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
	alias pacloc='pacman -Qi'		# Display information about a given package in the local database
	alias paclocs='pacman -Qs'		# Search for package(s) in the local database
	alias paclo="pacman -Qdt"		# List all packages which are orphaned
	alias pacc="sudo pacman -Scc"		# Clean cache - delete all the package files in the cache
	alias paclf="pacman -Ql"		# List all files installed by a given package
	alias pacown="pacman -Qo"		# Show package(s) owning the specified file(s)
	alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
	alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed
	# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
	alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"
	alias pacbac="pacman -Qqen"		# List all explicity installed packages
	alias pacback="pacman -Qqem"		# List explicitly installed non-repo packages
fi
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias open=xdg-open
alias c='xclip -sel clip'
alias p='xclip -o -sel clip'
alias vssh='TERM=xterm vagrant ssh'
alias vim=nvim

alias glsb='git log --graph --decorate --oneline --all --simplify-by-decoration'

# Host specific configuration
HOST_NAME=$(/usr/bin/env hostname)
if [ $HOST_NAME = "belka" ]; then
	export CHEF_PATH="$HOME/Projects/UA/chef_configs"
	export AIRSHIP_PATH="$HOME/Projects/UA/airship"
	export PATH=$HOME/.gem/ruby/2.2.0/bin:$PATH
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# update path to put node_modules first, this must be done *after* nvm
export PATH="./node_modules/.bin:$PATH"

source $HOME/.boxrc
