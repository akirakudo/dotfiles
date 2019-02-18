export EDITOR=vim

export PATH="/usr/local/Cellar/mysql/5.6.27/bin:$PATH"
export PATH="/usr/local/Cellar/git/2.11.1/bin:$PATH"
export PATH="/usr/local/Cellar/imagemagick@6/6.9.8-10/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH="$HOME/.rbenv/bin:$PATH" 
eval "$(rbenv init - zsh)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export HISTSIZE=1000

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/akira_kudo/Work/GoogleCloud/natural-language-sample/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/akira_kudo/Work/GoogleCloud/natural-language-sample/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/akira_kudo/Work/GoogleCloud/natural-language-sample/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/akira_kudo/Work/GoogleCloud/natural-language-sample/google-cloud-sdk/completion.zsh.inc'; fi

export PKG_CONFIG_PATH="/usr/local/Cellar/imagemagick@6/6.9.8-10/lib/pkgconfig/"

eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
