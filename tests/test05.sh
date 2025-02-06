#!/bin/dash

if [ -d ".pushy" ]; then
    rm -r ".pushy"
fi
if [ -f "show-test" ]; then 
    rm -r "show-test"
fi

./pushy-init 1>/dev/null

#missing arguments
output1=$(./pushy-show)
if [ "$output1" = "usage: pushy-show <commit>:<filename>" ]; then
    echo "Test4.1 passed"
else
    echo "Test4.1 failed, expected 'usage: pushy-show <commit>:<filename>', actually $output1"
    exit 1
fi

#invalid arguments
output2=$(./pushy-show 4)
if [ "$output2" = "pushy-show: error: invalid object 4" ]; then
    echo "Test4.2 passed"
else 
    echo "Test4.2 failed, expected 'pushy-show: error: invalid object 4', actually $output2"
    exit 1
fi
output3=$(./pushy-show 4:)
if [ "$output3" = "pushy-show: error: invalid filename ''" ]; then
    echo "Test4.3 passed"
else 
    echo "Test4.3 failed, expected pushy-show: error: invalid filename '', actually $output3"
    exit 1
fi

#file not in index
output4=$(./pushy-show :notexist)
if [ "$output4" = "pushy-show: error: 'notexist' not found in index" ]; then
    echo "Test4.4 passed"
else
    echo "Test4.4 failed, expected 'pushy-show: error: 'notexist' not found in index', actually $output4"
    exit 1
fi

#normal show
echo hello >show-test
./pushy-add show-test
./pushy-commit -m "commit1" 1>/dev/null

output5=$(./pushy-show 0:show-test)
if [ "$output5" = "hello" ]; then
    echo "Test4.5 passed"
else 
    echo "Test4.5 failed, expected 'hello', actually $output5"
    exit 1
fi

