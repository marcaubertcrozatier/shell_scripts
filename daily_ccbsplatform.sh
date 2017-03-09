#!/bin/sh
cd /space/nsuser/p4client/ccbs/swf/platform
. ./build.mk
export P4PORT P4CLIENT P4USER P4PASSWD
newnut=`/usr/local/bin/p4 label -o NUTCCBSSUCCESS | grep "Update:"|tail -1`
oldnut=`cat /home/nsuser/tools/nutccbssuccess`
if [ "${oldnut}" = "${newnut}" ]
then exit
#then mail product@netonomy.com swflist@netonomy.com swfmail@netonomy.com < /export/home/nsuser/tools/mailnut
#         exit
fi
rm -f /home/nsuser/tools/nutccbssuccess
echo "$newnut" > /home/nsuser/tools/nutccbssuccess
/usr/local/bin/p4 sync //depot/ccbs/swf/platform/... >/dev/null
cd /space/nsuser/p4client/ccbs/platform
#sh /home/nsuser/shell/p4ccbsclean.sh > /dev/null
cd /space/nsuser/p4client/ccbs/swf/platform

oldbuildnum=`/usr/local/bin/p4 labels | grep $PROJECT|grep -v M5|grep -v M6 |grep -v RA|grep -v labeltemplate| grep -v BUILDCCBSSUCCESS|grep -v "c-one"|grep -v "[0-9]\-"| grep -v "[0-9]\_"| sort -n -t"-" -k 3,3 | awk '{print $2}' | tail -1| awk -F"-" '{print $4}'`
buildnum=`expr $oldbuildnum + 1`
oldlabel="$PROJECT-"$oldbuildnum
/usr/local/bin/p4 labels |grep $PROJECT|grep -v M5|grep -v M6 |grep -v RA|grep -v labeltemplate| grep -v BUILDCCBSSUCCESS|grep -v "c-one"| grep -v "[0-9]\-"| grep -v "[0-9]\_"|sort -n -t"-" -k 3,3|awk '{print $2}'|tail -10 > /tmp/autobuild.$$
labelnum=`grep -n $oldlabel /tmp/autobuild.$$| awk -F":" '{print $1}'`
if [ $labelnum != 10 ]
then labelnum=`expr $labelnum + 1`
fi
rm -f /tmp/autobuild.$$
sh netonobuild.sh auto >/tmp/autobuild.log << !EOF
$MAKELABEL
$DEFAULT
$VERSION
$PVERSION
NUTCCBSSUCCESS
$DEFAULT
$BUILD
$labelnum
!EOF
if [ $? = 1 ]
then exit 1
fi
sh netonobuild.sh >/tmp/autobuild.log << !EOF
$MAIL
$TODEV
$SORTIR
!EOF
cd /home/nsuser
