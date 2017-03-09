#!/bin/sh
cd /space/nsuser/p4client/ccbs/swf/ocm/scripts
. ./build.mk
export P4PORT P4CLIENT P4USER P4PASSWD
#CCBSOCMSUCCESS
newnut=`/usr/local/bin/p4 label -o CCBSOCMSUCCESS | grep "Access:"|tail -1`
oldnut=`cat /home/nsuser/tools/ccbsocmsuccess`
if [ "${oldnut}" = "${newnut}" ]
then exit
fi
rm -f /home/nsuser/tools/ccbsocmsuccess
echo "$newnut" > /home/nsuser/tools/ccbsocmsuccess
/usr/local/bin/p4 sync -f //depot/ccbs/ocm/... >/dev/null
/usr/local/bin/p4 sync -f //depot/ccbs/swf/ocm/... >/dev/null

#########################
oldbuildnum=`/usr/local/bin/p4 labels | grep $PROJECT|grep -v M5|grep -v M6|grep -v labeltemplate| grep -v BUILDCCBSSUCCESS|grep -c "c-one"| sort -k 8,8 | awk '{print $2}' | tail -1| awk -F"-" '{print $4}'`
buildnum=`expr $oldbuildnum + 1`
oldlabel="$PROJECT-"$oldbuildnum
/usr/local/bin/p4 labels |grep $PROJECT|grep -v M5|grep -v M6|grep -v labeltemplate| grep -v BUILDCCBSSUCCESS|grep -c "c-one"| sort -k 8,8|awk '{print $2}'|tail -10 > /tmp/autobuild.$$
labelnum=`grep -n $oldlabel /tmp/autobuild.$$| awk -F":" '{print $1}'`
if [ $labelnum != 10 ]
then labelnum=`expr $labelnum + 1`
fi
rm -f /tmp/autobuild.$$
#########################

sh netonobuild.sh >/tmp/autobuild.log << !EOF
$MAKELABEL
$DEFAULT
$VERSION
$PVERSION
$DEFAULT
$DEFAULT
$BUILD
$LABELNUM
$DEFAULT
$MAIL
$TODEV
$DEFAULT
$SORTIR
!EOF
cd /home/nsuser
