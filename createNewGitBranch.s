#!/bin/bash

BRANCH=$1
answer="No"

if [[ $BRANCH != "master" ]]
then
    printf "\n"
    echo "####################################################################"
    echo " $BRANCH : Creating a new branch..."
    echo "####################################################################"
    printf "\n"

    git checkout -b $BRANCH

    if [ $? == 0 ]
    then
        printf "\n"
        echo "########################################################"
        echo -n "Do you need to upstream the branch(Y/N)?"
        echo "########################################################"
        printf "\n"
        read answer
        if [ "$answer" == "${answer#[Nn]}" ]
        then
            echo $answer
            git push --set-upstream origin $BRANCH
            if [ $? == 0 ]
            then
                printf "\n"
                echo "########################################################"
                echo "$BRANCH : Branch created Successfully..."
                echo "########################################################"
                printf "\n"
            else
                printf "\n"
                echo "########################################################"
                echo "$BRANCH : Branch cannot be upstreamed..."
                echo "########################################################"
                printf "\n"
            fi
        else
            printf "\n"
            echo "########################################################"
            echo "Branch only created locally and not upstreamed..."
            echo "########################################################"
            printf "\n"
        fi
    else
        printf "\n"
        echo "################################################################"
        echo "$BRANCH : Branch already exists!!"
        echo "################################################################"
        printf "\n"
    fi
else
    printf "\n"
    echo "####################################################################"
    echo " WARNING : Cannot create a new branch with name master!!"
    echo "####################################################################"
    printf "\n"
fi
