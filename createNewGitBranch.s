#!/bin/bash

if [ $# == 1 ]
then
    BRANCH=$1
    answer="No"
else
    printf "\n"
    echo "####################################################################"
    echo "Please provide a branch name to create..."
    echo "####################################################################"
    printf "\n"
    exit 1
fi

if [[ $BRANCH == "master" ]] || [[ $BRANCH == "release/Release_Banknet_"* ]]
    then
    printf "\n"
    echo "####################################################################"
    echo "$WARNING : Master/Release branch cannot be created !!"
    echo "####################################################################"
    printf "\n"
    exit 2
fi

printf "\n"
echo "####################################################################"
echo " $BRANCH : Creating a new branch..."
echo "####################################################################"
printf "\n"

git checkout -b $BRANCH;

if [ $? == 0 ]
then
    printf "\n"
    echo "########################################################"
    echo "Do you need to upstream the branch(Y/N)?"
    echo "########################################################"
    printf "\n"
    read answer
    if [ "$answer" == "${answer#[Nn]}" ]
    then
        origin=$(git remote get-url origin)
        origin_with_pass=${origin/"//"/"//{USERID}:{PASSWD/STATIC TOKEN}@"}    // remove the "{}" after replacing user-id and passwd
        git push --set-upstream $origin_with_pass $BRANCH;
        if [ $? == 0 ]
        then
            printf "\n"
            echo "########################################################"
            echo "$BRANCH : Branch created Successfully..."
            echo "########################################################"
            printf "\n"
            git branch;
            exit 0
        else
            printf "\n"
            echo "########################################################"
            echo "$BRANCH : Branch cannot be upstreamed..."
            echo "########################################################"
            printf "\n"
            exit 3
        fi
    else
        printf "\n"
        echo "########################################################"
        echo "Branch only created locally and not upstreamed..."
        echo "########################################################"
        printf "\n"
        exit 0
    fi
else
    printf "\n"
    echo "################################################################"
    echo "$BRANCH : Branch already exists!!"
    echo "################################################################"
    printf "\n"
    exit 4
fi
