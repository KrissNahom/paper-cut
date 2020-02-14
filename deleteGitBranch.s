#!/bin/bash

if [ $# == 1 ]
then
    BRANCH=$1
else
    printf "\n"
    echo "####################################################################"
    echo "Please provide a branch name to delete..."
    echo "####################################################################"
    printf "\n"
    exit 1
fi

if [[ $BRANCH == "master" ]] || [[ $BRANCH == "release/Release_"* ]]
    then
    printf "\n"
    echo "####################################################################"
    echo "$WARNING : Master/Release branch cannot be deleted !!"
    echo "####################################################################"
    printf "\n"
    exit 1
fi

git checkout $BRANCH
if [ $? == 0 ]
    then
        git pull
        if [ $? == 0 ]
        then
            printf "\n"
            echo "###########################################################"
            echo "$BRANCH :  Branch available in remote"
            echo "###########################################################"
            printf "\n"
            origin=$(git remote get-url origin)
            origin_with_pass=${origin/"//"/"//{USERID}:{PASSWD/STATIC TOKEN}@"}    //remove "{}" after replacing user-id and passwd.
            git checkout master;git push origin_with_pass --delete $BRANCH;git branch -D $BRANCH;
            printf "\n"
            echo "###########################################################"
            echo "$BRANCH :  Branch deleted from remote and local"
            echo "###########################################################"
            echo "###########################################################"
            printf "\n"
            exit 0
        else
            printf "\n"
            echo "###########################################################"
            echo "$BRANCH :  Branch available only in local"
            echo "###########################################################"
            printf "\n"
            git checkout master;git branch -D $BRANCH;
            printf "\n"
            echo "###########################################################"
            echo "$BRANCH :  Branch deleted only from local"
            echo "###########################################################"
            printf "\n"
            exit 0
        fi
else
    printf "\n"
    echo "####################################################################"
    echo "$BRANCH :  Branch Unavailable"
    echo "####################################################################"
    printf "\n"
    exit 1
fi
