#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

setopt caseglob

# Customize to your needs...
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

path=(
  $HOME/usr/bin
  $path
)

### my aliases
alias npm-exec='PATH=$(npm bin):$PATH'
alias dc='docker-compose'
alias dcl='docker-compose logs --tail=200'

eval "$(pyenv init -)"

export PATH="/Users/kenneth/.fictiv-arcanist/arcanist/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. /usr/local/etc/profile.d/z.sh
