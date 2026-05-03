#!/bin/bash

NUM_OF_ITERATIONS=1

create_file() {
    echo "######################################################"
    echo "#######          Creating File                 #######"
    echo "######################################################"
    echo "Dummy-Text-for-Commit" >> dummy_file_$i.dat
}

delete_file() {
    echo "######################################################"
    echo "#######          Deleting File                 #######"
    echo "######################################################"
    rm dummy_file_$i.dat
}

commit_to_remote_repo() {
    git add ./
    git commit -m "Add dummy_file_$i.dat"
    git push -u origin main
    echo ""
}

for ((i = 1; i <= $NUM_OF_ITERATIONS; i++)); do

    create_file $i
    commit_to_remote_repo $i

    delete_file $i
    commit_to_remote_repo $i

done
