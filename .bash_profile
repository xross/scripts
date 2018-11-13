
# User specific aliases and functions
export PATH=$PATH:$HOME/tools/
export PATH=$PATH:$HOME/xgit/
export PATH=$PATH:$HOME/xgit/scripts/
export PATH=$PATH:$HOME/scripts/
export PATH=$PATH:$HOME/Library/Python/2.7/bin 


export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"


# Prompt
if [ $HOSTNAME = "muc.local" ] ; then
    PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\$ "
else
    #PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\[\e[31m\]\h\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n\$ "
    PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \[$txtred\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\$ "
fi

function hash-all
{
  find . -type d -print -mindepth 1 -maxdepth 1 -exec git -C {} rev-parse HEAD \; -exec git -C {} branch\;
}
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="/usr/local/opt/bison/bin/bison:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"

function git_branches()
{
    if [[ -z "$1" ]]; then
        echo "Usage: $FUNCNAME <dir>" >&2
        return 1
    fi

    if [[ ! -d "$1" ]]; then
        echo "Invalid dir specified: '${1}'"
        return 1
    fi

    # Subshell so we don't end up in a different dir than where we started.
    (
        cd "$1"
        for sub in *; do
            [[ -d "${sub}/.git" ]] || continue
            echo "$sub [$(cd "$sub"; git  branch | grep '^\*' | cut -d' ' -f2)]"
        done
    )
}
