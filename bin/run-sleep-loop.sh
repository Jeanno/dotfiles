#!/bin/bash

pid=0
run_interval=$1
sleep_interval=$2
shift
shift
run_cmd=$@


echo run_interval=$run_interval
echo sleep_interval=$sleep_interval
echo run_cmd=$run_cmd

while [[ true ]]
do
    $run_cmd &
    pid=$!
    trap "echo 'Bye'; kill $pid; exit;" INT
    sleep $run_interval
    kill $pid 2> /dev/null || break
    sleep $sleep_interval
done

echo 'Finished'
