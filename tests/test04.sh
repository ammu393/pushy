#!/bin/dash

if [ -d ".pushy" ]; then
    rm -r ".pushy"
fi
if [ -f "log-test" ]; then 
    rm -r "log-test"
fi

./pushy-init 1>/dev/null
echo hello >log-test
./pushy-add log-test
./pushy-commit -m "commit1" 1>/dev/null

output=$(./pushy-log)
if [ "$output" = "0 commit1" ]; then
    echo "Test3 passed"
else 
    echo "Test3 failed, pushy log incorrect"
    exit 1
fi

if [ -d ".pushy" ]; then
    rm -r ".pushy"
fi