#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-scripts"
log_file="$logs_folder/$0.log"


mkdir $logs_folder

if [ $user_id -ne 0  ]; then

   echo "Run with root privilages" | tee -a $log_file
   exit 1

fi

validate(){
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE" | tee -a $log_file
        exit 1
    else
        echo "$2 ... SUCCESS" | tee -a $log_file
    fi
}


for package in $@
do

   dnf install $package -y &>> $log_file
   validate $? "$package installation"

done

