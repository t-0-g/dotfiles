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
FACE='%(?.%F{cyan}%(!.#.)%f.%F{magenta}%(!.#.(ﾉд-｡%)))%f'
PROMPT='%F{cyan}%n:%F{white}[%F{cyan}%~%F{white}] %F{gray}%*#%! $FACE
$ '

SPROMPT='
 - %F{red}%B%r%b%f ? [y/n]:'
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
#
# alias
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -aG"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias beep='echo $'\''\a'\'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias python=python3
alias sl='sl -e'
alias tree='tree -C'
alias emacs='emacs -nw'
alias e='emacs -nw'
alias pip='pip3'

# vscode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src


export JAVA_HOME=`/usr/libexec/java_home -v "11"`
export GOPATH=$HOME/dev
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:${JAVA_HOME}/bin




#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/t0g/.sdkman"
[[ -s "/Users/t0g/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/t0g/.sdkman/bin/sdkman-init.sh"
