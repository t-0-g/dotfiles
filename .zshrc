

setopt correct
setopt prompt_subst
setopt no_beep
setopt no_flow_control
setopt interactive_comments
setopt extended_glob

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# colors
autoload colors; colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt hist_reduce_blanks
setopt share_history
setopt histignorealldups

# prompt
FACE='%(?.%F{cyan}%(!.#.)%f.%F{red}%(!.#.(ﾉд-｡%)))%f'
PROMPT='%f%F{cyan}%n@%m:%F{white}[%F{cyan}%~%F{white}] %F{magenta}%*#%! $FACE
$ '

SPROMPT='
もしかして%F{red} %B%r%b %fではありませんか? [はい(y), いいえ(n)]:'
RPROMPT=$'`branch-status-check`  ' # %~はpwd

# git 
# {{{ methods for RPROMPT
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
function branch-status-check {
    local prefix branchname suffix
        # .gitの中だから除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いので除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'

        if [ $prefix = '%{'${fg[yellow]}'%}' ]; then
            echo ${prefix}'(+'${branchname}')'${suffix}
        elif [ $prefix = '%{'${fg[red]}'%}' ]; then
            echo ${prefix}'(+'${branchname}')'${suffix}
        elif [ $prefix = '%{'${fg[cyan]}'%}' ]; then
            echo ${prefix}'(*'${branchname}')'${suffix}
        else
            echo ${prefix}'('${branchname}')'${suffix}
        fi

}

function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}

function get-branch-status {
    local res color
        output=`git status --short 2> /dev/null`
        if [ -z "$output" ]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}
# }}}

# alias
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias beep='echo $'\''\a'\'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias python=python3
alias sl='sl -e'
alias tree='tree -C'
alias emacs='emacs -nw'
alias e='emacs -nw'

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/fabric/bin
