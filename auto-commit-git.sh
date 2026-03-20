#!/bin/bash

NUM_OF_ITERATIONS=1

for ((i = 1; i <= $NUM_OF_ITERATIONS; i++)); do

    echo "######################################################"
    echo "#######          Creating File                 #######"
    echo "######################################################"
    echo "Dummy-Text-for-Commit" >>dummy_file_$i.dat
    git add ./
    git commit -m "Add dummy_file_$i.dat"
    git push -u origin main
    echo ""

    echo "######################################################"
    echo "#######          Deleting File                 #######"
    echo "######################################################"
    rm dummy_file_$i.dat
    git add ./
    git commit -m "Remove dummy_file_$i.dat"
    git push -u origin main
    echo ""

done
