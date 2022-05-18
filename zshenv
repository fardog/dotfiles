# fix vscode git
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# fix things for webstorm
export PATH=./node_modules/.bin:/home/nwittstock/.nvm/current/bin:$PATH
export GOPATH=/home/nwittstock/gocode
export PATH=$GOPATH/bin:$PATH

# add home paths for dmenu
export PATH=$HOME/.dotfiles/bin:$HOME/.bin:$PATH

# pyvenv
export WORKON_HOME=$HOME/workon

#export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

source $HOME/.boxrc
