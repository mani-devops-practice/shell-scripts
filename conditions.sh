#!/bin/bash

number=$1

if [ $number == 20 ]; then
   echo "Given $number is equal to 20"
elif [ $number > 20 ]; then
   echo "Given $number is greater than 20"
else
    echo "Given $number is less than 20"
fi
