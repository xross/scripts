
# User specific aliases and functions
export PATH=$PATH:$HOME/tools/
export PATH=$PATH:$HOME/xgit/
export PATH=$PATH:$HOME/xgit/scripts/
export PATH=$PATH:$HOME/scripts/

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

PATH="/usr/local/bin:$PATH"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

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
