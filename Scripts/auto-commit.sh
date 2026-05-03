#!/bin/bash

SKIP_COMMIT=true
NUM_OF_ITERATIONS=15
file_created=false

create_file() {
    echo "######################################################"
    echo "#######          Creating File                 #######"
    echo "######################################################"
    echo "Dummy-Text-for-Commit" >> dummy_file_$i.dat

    file_created=true
}

delete_file() {
    echo "######################################################"
    echo "#######          Deleting File                 #######"
    echo "######################################################"
    rm dummy_file_$i.dat

    file_created=false
}

commit_to_remote_repo() {
    commit_message_verb=''
    if [ "$file_created" = true ]; then
        commit_message_verb="Add"
    else
        commit_message_verb="Remove"
    fi

    if [ "$SKIP_DEBUG" = true ]; then
        echo "COMMIT_MSG: $commit_message_verb dummy_file_$i.dat"
        return
    fi

    git add ./
    git commit -m "$commit_message_verb dummy_file_$i.dat"
    git push -u origin main
    echo ""
}

main() {
    for ((i = 1; i <= $NUM_OF_ITERATIONS; i++)); do

        create_file $i
        commit_to_remote_repo $i

        delete_file $i
        commit_to_remote_repo $i

    done
}

main
