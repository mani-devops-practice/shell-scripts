#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
N_DAYS={$3:-14} #14 days default if gvien take $3 arg



if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" 
    exit 1
fi

mkdir -p $LOGS_FOLDER


usage() {

    echo -e "$R USAGE:: sudo backup <src dir> <dest_dir> <days>[default 14 days] $N"
    exit 1
}


if [ $# -lt 2 ]; then
    usage
fi

if [ ! -d $SOURCE_DIR  or ! $DEST_DIR ]; then
    echo " $R $SOURCE_DIR or $DEST_DIR doesnot exists $N"
    exit 1
fi

# Find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type file -mtime +$N_DAYS)

if [ -z "${FILES}" ]; then
    echo -e "No need to backup $Y ... skipping $N"
else
    while IFS= read -r filename; do
        echo "$filename"
    done <<< $FILES
fi



