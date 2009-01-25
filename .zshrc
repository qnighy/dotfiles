#::::zsh setting file::::
#I think it would not work well in zsh version 4.3.2


# ::set key bind
bindkey -v

# ::prompt setting
PROMPT='%B%F{blue}%n@%m:%b%f%~
%(?.%f.%S%F{red})%#%f%s '
PROMPT2='%_>%(?.%f.%S%F{red})%#%f%s '
PROMPT3='?#'
PROMPT4='+%N:%i>'
RPROMPT='%F{red}%D{%Y/%m/%d %H:%M:%S}%f %!/%y'
#RPROMPT2='%F{red}%D{%Y/%m/%d %H:%M:%S}%f %!/%y'

# ::autoload
# complement setting
autoload -U compinit;compinit
# predict complement setting
#autoload -U predict-on;predict-on
# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# zed
autoload zed

# ::keybind
bindkey {"^[OH","^[[1;5D","^[[1~"} beginning-of-line
bindkey {"^[OF","^[[1;5C","^[[4~"} end-of-line
bindkey {"^P","^[[5~","^[[1;5A"} history-beginning-search-backward-end
bindkey {"^N","^[[6~","^[[1;5B"} history-beginning-search-forward-end 

# ::terminal title
case "${TERM}" in
kterm*|xterm|rxvt|cygwin)
    precmd() {
        #echo -ne "\e]0;${USER}@${HOST%%.*}:${PWD}\a"
        wdhome=$(pwd|awk "{sub(\"^${HOME}\",\"~\",\$1);print \$1}")
        echo -ne "\e]0;${wdhome}(${USER}@${HOST%%.*})\a"
    }
    ;;
esac

# ::set options
setopt extended_glob
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_no_store
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
unsetopt correct
setopt list_packed
setopt nolistbeep
setopt nobeep
setopt multios

# ::aliases
alias RELOAD="source ~/.zshrc"
alias where="command -v"
alias j="jobs -l"
alias gp="ps ax|grep"
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls="ls -h --color=auto"
    alias la="ls -ha"
    alias lf="ls -hF"
    alias ll="ls -hl"
fi
alias du="du -h"
alias df="df -h"
alias su="su -l"
if which sl 1>/dev/null 2>/dev/null
then
    alias a="sl"
    alias aa="sl"
    alias aaa="sl"
    alias aaaa="sl"
    alias aaaaa="sl"
    alias public="sl"
    alias void="sl"
    alias ks="echo 新製品が安い！ケーズデンキ"
fi

# ::history setting
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000000000

zstyle ':completion:*' list-colors ''

# ::set default editor
for edt in vim vi emacs ex
do
	if which $edt 1>/dev/null 2>/dev/null
	then
		export EDITOR=$edt
		break
	fi
done

# ::load environment-depend setting
if [ -f .zshrc_env ]
then
	source .zshrc_env
fi

