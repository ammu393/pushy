#!/bin/dash


#if correctly overwrite file with same name
echo hello >add-test
./pushy-add add-test
if [ "$(cat add-test)" = "$(cat ".pushy/HEAD/master/index/add-test")" ]; then
    echo "Test2 passed"
else
    echo "Test2 failed, didn't successfully update files"
    exit 1
fi


echo hello >add2-test
echo world >> add2-test
./pushy-add add-test
if [ "$(cat add-test)" = "$(cat ".pushy/HEAD/master/index/add-test")" ]; then
    echo "Test2 passed"
else
    echo "Test2 failed, didn't successfully update files"
    exit 1
fi