#!/bin/sh
P4CLIENT=fan_integ
BRANCH=301TR5
TARGET=//depot/cbs3/301/...
SOURCE=//depot/ccbs/...
TMP=/tmp
p4 sync $TARGET
p4 sync $SOURCE
echo;echo;echo "-----------------------------------"
echo "Enter changelist to integrate:"
while read cl
do
	if [ "${cl}" = "" ]
	then exit
	fi
        p4 integrate -o -d -t -b $BRANCH //...@$cl,@$cl
	p4 resolve -o -at `p4 opened|awk -F"#" '{print $1}'`
	p4 change -o $cl > $TMP/change.tmp
        nbl=`wc -l $TMP/change.tmp|awk '{print $1}'`
        rl=`expr $nbl - 25`
        de=`tail -$rl $TMP/change.tmp|sed -e "s/\t//"`
        p4 submit -d "SWF:$cl:$de"
	echo;echo "-----------------------------------"
	echo "Enter changelist to integrate:"
done
