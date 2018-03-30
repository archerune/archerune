############################
## .bashrc git_completion

__hostname() {
    hostname -s | sed -r 's/dhcp-(.*)$/mac/'
}

source $HOME/git_completion

export PS1='\[\033[01;32m\]# $(__hostname)\[\033[01;34m\] \w \[\033[31m\]$(__git_ps1 "(%s)")\n\[\033[01;32m\]> \[\033[00m\]'
