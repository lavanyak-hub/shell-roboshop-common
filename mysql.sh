#!/bin/bash

source ./common.sh

check_root

dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "Installing MySQL Server"
systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? "Enabling MySQL Server"
systemctl start mysqld &>>$LOG_FILE
VALIADTE $? "Starting MySQL Server"
mysql_secure_installation --set-root-pass RoboShop@1 &>>$LOG_FILE
VALIDATE $? "Setting root password to MySQL Server"

print_total_time