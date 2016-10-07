#!/bin/bash

git-rewrite-author() {
    local old_author="$1"
    local old_email="$2"
    local new_author="$3"
    local new_email="$4"

    git filter-branch --env-filter 'if [ "$GIT_AUTHOR_NAME" = "$old_author" -a "$GIT_AUTHOR_EMAIL" = "$old_email" ]; then
        export GIT_AUTHOR_NAME="$new_author";
        export GIT_AUTHOR_EMAIL="$new_email";
    fi;' --tag-name-filter cat -f -- --all
}
