#!/bin/dash

if [ -d ".pushy" ]; then
    rm -r ".pushy"
fi

output1=$(./pushy-init)
if [ "$output1" = "Initialized empty pushy repository in .pushy" ] && [ -d ".pushy" ]; then
    echo "Test0.1 passed"
else 
    echo "Test0.1 failed, expected 'Initialized empty pushy repository in .pushy', actually $output1"
    exit 1
fi

#check repeated init
output2=$(./pushy-init)
if [ "$output2" = "pushy-init: error: .push already exists" ]; then
    echo "Test0.2 passed"
else 
    echo "Test0.2 failed, expected 'pushy-init: error: .pushy already exists', actually $output2"
    exit 1
fi

#check init branch
curr_branch=$(cat ".pushy/currBranches.txt")
if [ "$curr_branch" = "master" ]; then
    echo "Test0.4 passed"
else 
    echo "Test0.4 failed, expected 'master', actually $curr_branch"
fi