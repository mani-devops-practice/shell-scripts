#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

validate(){
   
    if [ $1 -ne 0 ]; then
      echo "Installing $2 ... FAILURE"
      exit 1
    else
      echo "Installing $2 ... SUCCESS"
    fi
}



echo "Installing Nginx"
dnf install nginx -y
validate $? "Nginix"


dnf install mysql -y
validate $? "Mysql"


dnf install nodejs -y
validate $? "NodeJs"


