#!/bin/bash

git-rewrite-author() {
    # shellcheck disable=SC2034
    local old_author="$1"
    # shellcheck disable=SC2034
    local old_email="$2"
    # shellcheck disable=SC2034
    local new_author="$3"
    # shellcheck disable=SC2034
    local new_email="$4"

    # shellcheck disable=SC2016
    git filter-branch --env-filter 'if [ "$GIT_AUTHOR_NAME" = "$old_author" -a "$GIT_AUTHOR_EMAIL" = "$old_email" ]; then
        export GIT_AUTHOR_NAME="$new_author";
        export GIT_AUTHOR_EMAIL="$new_email";
    fi;' --tag-name-filter cat -f -- --all
}

git-find-large-object() {
    # Shows you the largest objects in your repo's pack file.
    # Written for osx.
    #
    # @see https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
    # @author Antony Stubbs
    
    # set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
    IFS=$'\n';
    
    # list all objects including their size, sort by size, take top 10
    objects=$(git verify-pack -v .git/objects/pack/pack-*.idx | grep -v chain | sort -k3nr | head)
    
    echo "All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file."
    
    output="size,pack,SHA,location"
    for y in $objects
    do
        # extract the size in bytes
        size=$(($(echo "$y" | cut -f 5 -d ' ')/1024))
        # extract the compressed size in bytes
        compressedSize=$(($(echo "$y" | cut -f 6 -d ' ')/1024))
        # extract the SHA
        sha=$(echo "$y" | cut -f 1 -d ' ')
        # find the objects location in the repository tree
        other=$(git rev-list --all --objects | grep "$sha")
        #lineBreak=`echo -e "\n"`
        output="${output}\n${size},${compressedSize},${other}"
    done
    
    echo -e "$output" | column -t -s ', '
}
