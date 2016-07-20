# fix things for webstorm
export PATH=./node_modules/.bin:/home/nwittstock/.nvm/current/bin:$PATH
export GOPATH=/home/nwittstock/gocode
export PATH=$GOPATH/bin:$PATH
alias npm=envpm

# enable font AA in java by default
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# add home paths for dmenu
export PATH=$HOME/.dotfiles/bin:$HOME/.bin:$PATH

# pyvenv
export WORKON_HOME=$HOME/workon
