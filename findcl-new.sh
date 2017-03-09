#/bin/sh
# setup the environment and run the real scripts (stored in perforce)
P4=/usr/local/bin/p4
P4PORT=perforce:1666
P4CLIENT=nutcracker
P4PASSWD=nsuser
export P4 P4PORT P4CLIENT P4PASSWD
$P4 sync //depot/platform/main/swf/nutcracker/nut_findcl.sh > /dev/null 2>&1
sh /home/p4client/platform/main/swf/nutcracker/nut_findcl.sh
