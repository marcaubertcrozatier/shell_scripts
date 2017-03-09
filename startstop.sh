#!/bin/sh
if [ -f /home/jerusalem2/httpd/html/nutcracker/stop ]
then
	for i in `ps -edf|grep nsuser |grep "/home/p4client/main/swf/build"|grep -v grep|awk '{print $2}'` `ps -edf|grep nsuser |grep "nutbuild.sh"|grep -v grep|awk '{print $2}'` `ps -edf|grep nsuser |grep make|grep -v grep|awk '{print $2}'` `ps -edf|grep nsuser |grep /usr/local/jdk1.3.1_03|grep -v grep|awk '{print $2}'` `ps -edf|grep nsuser |grep /usr/java/j2sdk1.4.1_01|grep -v grep|awk '{print $2}'` `ps -edf|grep nsuser |grep *.sh|grep -v grep|awk '{print $2}'`
	do
		echo $i
	done
fi
