
# User specific aliases and functions
export PATH=$PATH:$HOME/tools/
export PATH=$PATH:$HOME/xgit/
export PATH=$PATH:$HOME/xgit/scripts/
export PATH=$PATH:$HOME/scripts/

export GITAWAREPROMPT=~/scripts/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

PATH="/usr/local/bin:$PATH"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

VENV="\$(virtualenv_info)";


export VIRTUAL_ENV_DISABLE_PROMPT=1

# Prompt
if [ $HOSTNAME = "LT-000905.local" ]; then
    PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\[\e[32m\]\\h \[\e[33m\]\w\[\e[0m\]\[$txtred\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$txtcyn\] ${VENV}\[$txtrst\]\n\$ "
elif [ $HOSTNAME = "muc.local" ]; then
    PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\[\e[32m\]\\h \[\e[33m\]\w\[\e[0m\]\[$txtred\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$txtcyn\] ${VENV}\[$txtrst\]\n\$ "
else
    PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\[\e[31m\]\\h \[\e[33m\]\w\[\e[0m\]\[$txtred\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$txtcyn\] ${VENV}\[$txtrst\]\n\$ "
fi

function hash-all
{
  find . -type d -print -mindepth 1 -maxdepth 1 -exec git -C {} rev-parse HEAD \; -exec git -C {} branch\;
}

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
