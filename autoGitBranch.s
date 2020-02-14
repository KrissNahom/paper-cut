#!/bin/bash

deleteBranch()
{
    git branch > /tmp/1.txt
    cat /tmp/1.txt
}

if [ $# -ge 1 ]
then
    printf "\n"
    echo "########################################################"
    echo "Enter to 1 to create branch and 2 to delete branch"
    echo "########################################################"
    printf "\n"
    read answer
    if [ "$answer" == "1" ]
    then
        ~/Dev_Cld1_scripts/createBranch.s $1
    elif [ "$answer" == "2" ]
    then
        deleteBranch
        #~/Dev_Cld1_scripts/deleteBranch.s $1
    else
        printf "\n"
        echo "Please provide a correct option..."
    fi
else
    printf "\n"
    echo "####################################################################"
    echo "Please provide a branch name to create/delete..."
    echo "####################################################################"
    printf "\n"
    exit 1
fi
