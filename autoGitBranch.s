#!/bin/bash

autoDeleteBranch()
{
    branches=$(git branch | cut -c 3-)
    END=$(date +%s)
    for branch in $branches
    do
        git co $branch
        git log -n 1 | grep -m2 Date
        month=$(git log -n 1 | grep -m1 Date | tr -s " " | cut -d " " -f 3)
        year=$(git log -n 1 | grep -m1 Date | tr -s " " | cut -d " " -f 6)
        date=$(git log -n 1 | grep -m1 Date | tr -s " " | cut -d " " -f 4)
        start=$(date -d "$month $date $year 00:00:00" +%s)
        diff=$((($END - $start)/86400))
        if [ diff -ge 90 ]
        then
            echo $diff
            #~/Dev_Cld1_scripts/deleteBranch.s $branch
        fi
    done

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
