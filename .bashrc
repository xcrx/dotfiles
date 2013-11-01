#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

command fortune

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

complete -cf sudo
complete -cf man

##############
#USER ALIASES#
##############
alias pacman='sudo pacman'
alias pacupdate='sudo pacman -Syu'
alias pacsearch='pacman -Ss'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias hist='history | grep'


todo() {
    if [[ ! -f $HOME/.todo ]]; then
        touch $HOME/.todo
    fi

    if [[ $# -eq 0 ]]; then
        cat $HOME/.todo
    elif [[ "$1" == "-l" ]]; then
        cat -n $HOME/.todo
    elif [[ "$1" == "-c" ]]; then
        echo "" > $HOME/.todo
    elif [[ "$1" == "-r" ]]; then
        cat -n $HOME/.todo
        echo -ne "----------------------------\nType a number to remove: "
        read NUMBER
        sed -ie ${NUMBER}d $HOME/.todo
    else
        echo "$@" >> $HOME/.todo
    fi
}

calc() {
    echo "scale=3;$@" | bc -l
}
