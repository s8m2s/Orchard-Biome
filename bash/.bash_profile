# source ~/.profile

# LOAD SSH KEYS USING SSH-AGENT
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Enable colors in bash
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# hide computer name in prompt
# export PS1="\W \$ "

# run scripts from anyware
export PATH=$PATH:$HOME/Scripts

# alias

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\h:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$ "

if [ -f "$NVM_DIR" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# allow wp cli to access mamp
if [ -f "/Applications/MAMP/" ]; then
    export PATH="/Applications/MAMP/bin/php/php7.1.12/bin:$PATH"
    export PATH=$PATH:/Applications/MAMP/Library/bin~ $
fi