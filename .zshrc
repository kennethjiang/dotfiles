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

### npm
alias npm-exec='PATH=$(npm bin):$PATH'

eval "$(pyenv init -)"
