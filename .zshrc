## Created by newuser for 5.9
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
#PROMPT='┌\e[0;32m\u@\h\e[m:\e[0;34m\w\e[m\n└$ '
#PROMPT='%F{green}%e%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
bindkey -v
KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      PROMPT=$'%F{white}╭%F{red}%n@%m%F{white}:%F{blue}%~%F{red}[N]
%F{white}╰$ ' ;;
        (main|viins) PROMPT=$'╭%F{red}%n@%m%F{white}:%F{blue}%~ 
%F{white}╰$ ' ;;
        (*)          PROMPT=$'╭%F{red}%n@%m%F{white}:%F{blue}%~ 
%F{white}╰$ ' ;;
    esac
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

setopt hist_ignore_all_dups

#ls aliases
alias ll='ls -lah'
alias la='ls -a '
alias lt='ls -aT' 
alias l.='ls -a | egrep "^\."'

#grep aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

#misc aliases
alias sudo='doas --'
alias grep='grep --color=auto'
alias rm='rm -fv'
alias mv='mv -i'
#you should comment the alias bellow its just to upload my dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
