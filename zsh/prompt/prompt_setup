#!/usr/bin/zsh
setopt prompt_subst

precmd_functions+=(build_prompt)

# Edite estas constantes para mudar os símbolos usados para mostrar as
# informações do git

GIT_PROMPT_PREFIX=" [ %F{yellow}λ:%f%F{blue}"
GIT_PROMPT_SUFFIX="%f ]"

GIT_PROMPT_DIRTY=""
GIT_PROMPT_CLEAN=""

GIT_PROMPT_ADDED="%F{green}+%f "
GIT_PROMPT_MODIFIED="%F{blue}!%f "
GIT_PROMPT_DELETED="%F{red}x%f "
GIT_PROMPT_RENAMED="%F{magenta}➜%f "
GIT_PROMPT_UNMERGED="%F{yellow}═%f "
GIT_PROMPT_UNTRACKED="%F{red}-%f "
GIT_PROMPT_STASHED="%B%F{red}S%f%b "
GIT_PROMPT_BEHIND="%B%F{red}↓%f%b "
GIT_PROMPT_AHEAD="%B%F{green}↑%f%b "

build_prompt() {
    # nome de usuário em amarelo
    # máquina em vermelho
    # path em verde (código 10)
    #
    # Edite para o que achar melhor.
    PROMPT_INFO="%F{yellow}%n%f@%F{red}%M%f %F{10}%~%f"
    GIT_INFO=$(get_git_info)

    # O prompt final será uma junção das informações do prompt acima, as
    # informações do git (se estiver em um repositório), uma quebra de linha
    # para digitar uma linha abaixo e uma seta (>) azul
    PROMPT=$(echo "$PROMPT_INFO$GIT_INFO\n%B%F{blue}>%f%b ")
}

# TODO to refactor with switch / using someting else than grep
# Might be faster using ripgrep too
get_git_info() {
    # If not inside a git repository, return
    [[ -z "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]] && return 0

    CURRENT_BRANCH_NAME=$(git branch --show-current 2> /dev/null)
    BRANCH_INFO="$CURRENT_BRANCH_NAME"

    INDEX=$(command git status --porcelain -b 2> /dev/null)

    STATUS=""

    if [[ ! -z $(echo "$INDEX" | command grep -E '^\?\? ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_UNTRACKED$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^A  ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_ADDED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^M  ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_ADDED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^MM ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_ADDED$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^ M ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_MODIFIED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^AM ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_MODIFIED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^MM ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_MODIFIED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^ T ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_MODIFIED$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^R  ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_RENAMED$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^ D ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_DELETED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^D  ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_DELETED$STATUS"
    elif [[ ! -z $(echo "$INDEX" | grep '^AD ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_DELETED$STATUS"
    fi

    if [[ ! -z $(command git rev-parse --verify refs/stash >/dev/null 2>&1) ]]; then
        STATUS="$GIT_PROMPT_STASHED$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^UU ' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_UNMERGED$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_AHEAD$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_BEHIND$STATUS"
    fi

    if [[ ! -z $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' 2> /dev/null) ]]; then
        STATUS="$GIT_PROMPT_DIVERGED$STATUS"
    fi

    if [[ ! -z $STATUS ]]; then
        STATUS=$(echo " %f$(echo $STATUS | xargs)")
    fi

    echo "$GIT_PROMPT_PREFIX$BRANCH_INFO$STATUS$GIT_PROMPT_SUFFIX"
}
