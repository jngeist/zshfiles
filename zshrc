# Path to your oh-my-zsh configuration.

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="mysphyt"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/Dropbox/scripts/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin/
export EDITOR='mvim -f'
export CDPATH=.:~:~/Dropbox:~/Dropbox/Documents/:~/Dropbox/Documents/CoS:~/Dropbox/Documents/CoS/Classes

setopt autopushd
setopt autocd
setopt aliases

func vim() {
    if [[ $(uname) == "Darwin" ]] ; then
        cwd=`pwd`
        cd /Applications/MacVim.app/Contents/MacOS
        ./Vim -f -c "cd $cwd" $@
        cd "$cwd"
        return
    else
        \vim $@
        return
    fi
}
func sshhome() {
    if $(airport -I | grep baptistageist) ; then
        ssh mysphyt@192.168.0.2 -L 5900:localhost:5900
    else
        ssh mysphyt@home.jnicholasgeist.com -p 22222 -L 5900:localhost:5900
    fi
}

alias cossh='ssh joshuag@cossh'
alias a2ssh='ssh joshuag@a2ssh -p 7822'
alias -g home 'home.jnicholasgeist.com'
alias reload_completions='rehash'
alias ez='mvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias manage='python manage.py $@'
autoload zmv


bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line

