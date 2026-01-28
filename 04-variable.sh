#!/bin/bash

echo "All args passed to script : $@"
echo "Number of arguments: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "who is running: $USER"
echo "pid of the script: $$"
sleep 100 &
echo "PID of recently executed background command: $!"
echo "All args passed to script: $*"


