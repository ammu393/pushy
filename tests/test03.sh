#!/bin/dash

if [ -d ".pushy" ]; then
    rm -r ".pushy"
fi
if [ -f "commit-test" ]; then 
    rm -r "commit-test"
fi

./pushy-init 1>/dev/null
echo hello >commit-test
./pushy-add commit-test

#missing arguments
output1=$(./pushy-commit)
if [ "$output1" = "usage: pushy-commit [-a] -m commit-message" ]; then
    echo "Test3 passed"
else
    echo "Test3 failed, expected 'usage: pushy-commit [-a] -m commit-message', actually $output1"
    exit 1
fi


# Testing nothing to commit
output2=$(./pushy-commit -m "Another commit")
expected_output="nothing to commit"
if [ "$output2" = "$expected_output" ]; then
    echo "Test6 passed: Testing nothing to commit"
else
    echo "Test6 failed, expected '$expected_output', actually $output6"
    exit 1
fi

# Commit with the -a flag
output7=$(./pushy-commit -a -m "Commit with -a flag")
expected_output="Committed as commit 2"
if [ "$output7" = "$expected_output" ]; then
    echo "Test7 passed: Commit with the -a flag"
else
    echo "Test7 failed, expected '$expected_output', actually $output7"
    exit 1
fi

