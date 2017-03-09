#!/bin/sh
#
#

############################# FOR OLU
VERSION=3.5.90-MSTAR4.5-TC1.0
#VERSION=3.5.50-Mstar1.75-1.0
#OLDVERSION=3.5.50-Mstar1.50-4.0
OLDVERSION=3.5.90-MSTAR3.4-TC6.0
NAME="cbs-css-apps-3.5.90-MSTAR4.5-1.0-3.5.90-MSTAR3.4-6.0"
ZIPNAME="cbs-css-apps-src_MSTAR-3.5.90-3.4_6.0.0_1"
#############################

export P4CLIENT=zanbe5apps_zan
export P4PORT=perforce:1666
export P4PASSWD=nsuser
export P4=/usr/local/bin/p4
#HARDPATH="/space/nsuser/p4client/cbs3/m1x/css-apps/"
HARDPATH="/space/nsuser/p4client/zanbe5/css-apps/"
BUILDS=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/$OLDVERSION
P4=/usr/local/bin/p4
P4PASSWD=nsuser
export P4PASSWD
#SRCROOT=//depot/c-one
#SRCROOT=//depot/cbs3/3.2.x
#SRCROOT=//depot/cbs3/3.5.x
SRCROOT=//depot/cm/cm_c_one_3.5.90_mstar
#SRCROOT=//depot/cbs3/3.5.MOBISTAR
#SRCROOT=//depot/cbs3/3.5.50-Mstar1.x
#SRCROOT=//depot/ccbs
#SRCROOT=//depot/cbs3/3.0.11
TMP=/tmp
HOME=/home/nsuser/shell
RNHOME=/home/jerusalem2/sf/cdimages/swf/ReleasesNotes/3.5.x
RNHOME2=/home/jerusalem/maubert/RN/3.5.x/
#ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build
ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/$VERSION
SUBJECT="3.5.x build status"
RECIP="Marc.Aubert@comverse.com"
#RECIP="Marc.Aubert@comverse.com,Mohamed.Inelhaj@comverse.com"
#
hardpath=`echo $HARDPATH|sed -e 's?/?\\\\/?g'`
rm -f $RNHOME/$NAME
rm -f $RNHOME/$NAME.html
rm -f $ROOTBUILDREP/$NAME.zip
rm -f $ROOTBUILDREP/$NAME.html
echo "<HTML>
<HEAD>
  <TITLE>Build status</TITLE>
</HEAD>

<BODY>" > $RNHOME/$NAME.html
cd $BUILDS

#
#for comp in platform ocm css-apps
for comp in css-apps
do
	if [ -f $TMP/$comp.txt ]
	then rm -f $TMP/$comp.txt
	fi
	if [ -f $TMP/${comp}2.txt ]
	then rm -f $TMP/${comp}2.txt
	fi
	if [ -f $TMP/${comp}_res.txt ]
	then rm -f $TMP/${comp}_res.txt
	fi
	#
	case $comp in
		platform) comp2=platform
                          complc=platform
			  buildrep=$ROOTBUILDREP;;
		ocm) comp2=ocm
                     complc=ocm
		     buildrep=$ROOTBUILDREP;;
		css-apps) comp2=apps
                      complc=css-apps
		      buildrep=$ROOTBUILDREP;;
	esac
	cd $buildrep
#	lastbuild=`\ls -d cbs-css-$comp2*|tail -1`
	lastbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'|tail -1`
	cd $BUILDS
#	lastrbuild=`\ls -d cbs-css-$comp2*`
	lastrbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'`
#	firstcl=`\ls -d cbs-css-$comp2*|awk -F"-" '{print $7}'`
	typeset -i firstcl=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'|awk -F"-" '{print $NF}'`
	typeset -i lastcl=`$P4 changes $SRCROOT/$complc/... |head -1|awk '{print $2}'`
	nbcl=`expr $lastcl - $firstcl`
	#
	if [ ! "${nbcl}" = "0" ]
	then $P4 changes -m $nbcl $SRCROOT/$complc/... |grep -v nsuser > $TMP/$comp.txt
	#$P4 changes -m $nbcl $SRCROOT/$complc/... |grep 112395 >> $TMP/$comp.txt
	else echo none > $TMP/$comp.txt
	fi
done
	#
#for comp in platform ocm css-apps
for comp in css-apps
do
	case $comp in
		platform) comp2=platform
			  buildrep=$ROOTBUILDREP;;
		ocm) comp2=ocm
		     buildrep=$ROOTBUILDREP;;
		css-apps) comp2=apps
		      buildrep=$ROOTBUILDREP;;
	esac
	cd $buildrep
	lastbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'|tail -1`
	cd $BUILDS
	lastrbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'`
	while read line
	do
		typeset -i cl=`echo $line|awk '{print $2}'`
		if [ $cl -gt $firstcl ]
			then	if [ -f $TMP/${comp}2.txt ]
				then 	if [ ! `grep $cl $TMP/${comp}2.txt` ]
					then echo $line >> $TMP/${comp}2.txt
					fi
				else echo $line >> $TMP/${comp}2.txt
				fi
		fi
	done < $TMP/$comp.txt
        echo "<H2><font color=0080ff>$lastbuild:</font></H2>" >> $RNHOME/$NAME.html
	if [ -f $TMP/${comp}2.txt ]
	then
                echo "<BR><BR>" >> $RNHOME/$NAME.html
		sort -n $TMP/${comp}2.txt > $TMP/${comp}3.txt
		mv $TMP/${comp}3.txt $TMP/${comp}2.txt
		while read line
		do
                        cl=`echo $line|awk '{print $2}'`
                        da=`echo $line|awk '{print $4}'`
                        au=`echo $line|awk '{print $6}'`
			$P4 change -o $cl > $TMP/change.tmp
			nbl=`wc -l $TMP/change.tmp|awk '{print $1}'`
			rl=`expr $nbl - 25`
			de=`tail -$rl $TMP/change.tmp|sed -e "s/\t//"`
			$P4 describe -s $cl > $TMP/desc.tmp
			nbl=`wc -l $TMP/desc.tmp|awk '{print $1}'`
			nbl=`expr $nbl - 1`
			rl=`expr $nbl - 6`
			head -$nbl $TMP/desc.tmp > $TMP/desc2.tmp
			tail -$rl $TMP/desc2.tmp > $TMP/desc.tmp
                        echo "<ul>" >> $RNHOME/$NAME.html
                        echo "<li>" >> $RNHOME/$NAME.html
                        echo "$de" >> $RNHOME/$NAME.html
                        echo "<ul>" >> $RNHOME/$NAME.html

			while read fi
			do

                                echo "<li>" >> $RNHOME/$NAME.html
                                echo "$fi" >> $RNHOME/$NAME.html
                                echo "</li>" >> $RNHOME/$NAME.html
##############
				fi2=`echo $fi | awk '{print $2}'`
				fi2=`echo $fi2 | awk -F "#" '{print $1}'`
				fi2=`p4 where $fi2 | awk '{print $3}'`
				fi2=`echo $fi2 | sed s/$hardpath//g`
				echo "$fi2" >> $RNHOME/$NAME

			done < $TMP/desc.tmp
                        echo "$fi" >> $RNHOME/$NAME.html
                        echo "</ul>" >> $RNHOME/$NAME.html
                        echo "</li>" >> $RNHOME/$NAME.html
                        echo "</ul>" >> $RNHOME/$NAME.html
		done < $TMP/${comp}2.txt
                echo "<BR><BR>" >> $RNHOME/$NAME.html
        else echo "<H7>none</H7>" >> $RNHOME/$NAME.html
	fi
       echo "<BR><HR><BR>" >> $RNHOME/$NAME.html
done
echo "</BODY></HTML>" >> $RNHOME/$NAME.html
cd $HARDPATH

if [ -d integration/sapi/client ]
then rm -rf integration/sapi/client
fi
mkdir -p integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-base.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-devtools-apt.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-onlinepc-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-csm-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-workflow-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-custom-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-dm.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-crm-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-financials-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-uapi-classpath.txt integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-inventory-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-single-ejb.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-obc-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-serviceability-shared.jar integration/sapi/client/jars
cp workspace/integration/sapi/client/jars/ccbs-udt-shared.jar integration/sapi/client/jars
# add version.properties and sapi files to the zip file
echo "version.properties" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-base.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-devtools-apt.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-onlinepc-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-csm-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-workflow-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-custom-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-dm.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-crm-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-financials-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-uapi-classpath.txt" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-inventory-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-single-ejb.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-obc-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-serviceability-shared.jar" >> $RNHOME/$NAME
echo "integration/sapi/client/jars/ccbs-udt-shared.jar" >> $RNHOME/$NAME

zip -q $ROOTBUILDREP/$NAME.zip `cat $RNHOME/$NAME`
cp $RNHOME/$NAME.html $ROOTBUILDREP
rm -rf integration/sapi/client
cd $ROOTBUILDREP
zip -q $ROOTBUILDREP/$ZIPNAME.zip $NAME.zip $NAME.html
rm -f $NAME.zip $NAME.html
