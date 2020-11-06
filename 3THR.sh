#!/bin/bash
clear
./.banner
   echo "Note After using m4skup tool use this "
   echo ""
   read -p "Enter the full path with m4skup file name: " fl
   read -p "Enter company name: " comp
   mkdir ~/recon/$comp &> /dev/null
   n=1
   cd ~/recon/$comp/ 
   mkdir 3THR &> /dev/null
   cd 3THR
port=$1
if  [ $port = "all" ]&> /dev/null ;
  then
       echo "runing port scan for all"
       echo ""
       while read ip ;
           do 
              sudo masscan $ip -p 0-65535 -Pn | tee -a all.txt
        done < $fl
else
   echo "scaning for particular service"
   echo ""
    while read line;do
         sudo masscan $line -p25,2525,110,143,995,993,821,587,465 -Pn >> smtp.txt
         sudo masscan $line -p80,443,8080,8443,8005,8009,8181,4848,9000,8008,9990,7001,9043,9060,9080,9443,1527,7777,4443 -Pn >> webserver.txt
         sudo masscan $line -p80,443,389,636,161,22,23,25,3389,53,119,143,993 -Pn >> common_services.txt
         sudo masscan $line -p50000,6379,1521,27017,3306,1433,11211,3306 -Pn >> database.txt
         sudo masscan $line -p10000 -Pn >> webmin.txt
         sudo masscan $line -p9090 -Pn >> websm.txt
         sudo masscan $line -p6379 -Pn >> redis.txt
         sudo masscan $line -p6800 -Pn >> scrapyd.txt
         sudo masscan $line -p3322 -Pn >> gitshell.txt
         sudo masscan $line -p8020 -Pn >> hadoopHDFS.txt
         sudo masscan $line -p8030 -Pn >> hadoopJOB.txt
         sudo masscan $line -p50070,50470 -Pn >> HDFS.txt
         sudo masscan $line -p19888,19890 -Pn >> mapReduce.txt
         sudo masscan $line -p8088,8090 -Pn >> yarn.txt
    done < $fl 
fi
