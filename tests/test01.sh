#!/bin/dash

if [ -d ".pushy" ]; then
    rm -r ".pushy"
fi
if [ -f "add-test" ]; then 
    rm -r "add-test"
fi

./pushy-init 1>/dev/null
touch add-test
#missing arguments
output1=$(./pushy-add)
if [ "$output1" = "usage: pushy-add <filenames>" ]; then
    echo "Test1.1 passed"
else 
    echo "Test1.1 failed, expected 'usage: pushy-add <filenames>', actually $output1"
    exit 1
fi

#the file added does not exist
output2=$(./pushy-add notexist)
if [ "$output2" = "pushy-add: error: can not open 'notexist'" ]; then
    echo "Test1.2 passed"
else
    echo "Test1.2 failed, expected pushy-add: error: can not open 'notexist', actually $output2"
    exit 1
fi

#normal add
./pushy-add add-test
if [ -f ".pushy/HEAD/master/index/add-test" ]; then
    echo "Test1.3 passed"
else 
    echo "Test1.3 failed, add file 'add-test' failed"
    exit 1
fi
