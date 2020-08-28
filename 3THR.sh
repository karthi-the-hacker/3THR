#!/bin/bash

clear
./.banner
echo "Note After using m4skup tool use this "
echo ""
read -p "Enter the full path with m4skup file name: " fl
read -p "Enter comany name: " comp
mkdir ~/recon/$comp
n=1
cd ~/recon/$comp/
mkdir 3THR
cd 3THR
while read line;do
 sudo masscan $line -p25,2525,110,143,995,993,821,587,465 -Pn >> smtp.txt
 sudo masscan $line -p80,443,8080,8443,8005,8009,8181,4848,9000,8008,9990,7001,9043,9060,9080,9443,1527,7777,4443 -Pn >> webserver.txt
 sudo masscan $line -p80,443,389,636,161,22,23,25,3389,53,119,143,993 -Pn >> common_services.txt
 sudo masscan $line -p500000,6379,1521,27017,3306,1433,11211,3306 -Pn >> database.txt
done < $fl 