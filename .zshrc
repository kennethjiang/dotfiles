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

# Customize to your needs...
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
