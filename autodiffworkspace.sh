#!/bin/sh
#
#

#############################
#VERSION=3.5.50-Mstar1.0-21.0
#OLDVERSION=3.5.50-Mstar1.0-19.2
#NAME="cbs-css-apps-3.5.50-MSTAR1.0-TC21.0-TC19.2"
#############################
export ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build/MOBAPPS/css-apps
export P4CLIENT=mobapps_zan
export P4PORT=perforce:1666
export P4PASSWD=nsuser
export P4=/usr/local/bin/p4
export CAPREP=/home/jerusalem2/sf/cdimages/swf/cap
HARDPATH="/space/nsuser/p4client/cbs3/mob/css-apps/"
P4=/usr/local/bin/p4
P4PASSWD=nsuser
export P4PASSWD
#SRCROOT=//depot/c-one
#SRCROOT=//depot/cbs3/3.2.x
#SRCROOT=//depot/cbs3/3.5.x
SRCROOT=//depot/cbs3/3.5.MOBISTAR
#SRCROOT=//depot/ccbs
#SRCROOT=//depot/cbs3/3.0.11
TMP=/tmp
HOME=/home/nsuser/shell
RNHOME=/home/jerusalem2/sf/cdimages/swf/ReleasesNotes/3.5.x
RNHOME2=/home/jerusalem/maubert/RN/3.5.x/
#ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build
#ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/$VERSION
SUBJECT="3.5.x build status"
RECIP="Marc.Aubert@comverse.com"
#RECIP="Marc.Aubert@comverse.com,Mohamed.Inelhaj@comverse.com"
#
hardpath=`echo $HARDPATH|sed -e 's?/?\\\\/?g'`

cd $ROOTBUILDREP
OLD=`ls -d cbs-css-apps*|sort -n -t"-" -k 8,8 | tail -2 | head -1`
NEW=`ls -d cbs-css-apps*|sort -n -t"-" -k 8,8 | tail -1`


comp="css-apps"
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
	comp2=apps
        complc=css-apps
	buildrep=$ROOTBUILDREP

	cd $buildrep
	lastbuild=$NEW
	lastrbuild=$OLD
	firstcl=`echo $OLD | awk -F"-" '{print $8}'`
	lastcl=`echo $NEW | awk -F"-" '{print $8}'`
	nbcl=`expr $lastcl - $firstcl`

#
NAME="cbs-css-apps-3.5.50-MSTAR1.0-$lastcl-$firstcl"
rm -f $RNHOME/$NAME
rm -f $RNHOME/$NAME-manifest.html
rm -f $ROOTBUILDREP/$NAME.zip
rm -f $ROOTBUILDREP/$NAME-manifest.html
echo "<HTML>
<HEAD>
  <TITLE>Build status</TITLE>
</HEAD>

<BODY>" > $RNHOME/$NAME-manifest.html
#

	if [ ! "${nbcl}" = "0" ]
	then $P4 changes -m $nbcl $SRCROOT/$complc/... |grep -v nsuser > $TMP/$comp.txt
	else echo none > $TMP/$comp.txt
	fi
	#
comp="css-apps"
comp2=apps
buildrep=$ROOTBUILDREP
	cd $buildrep
	lastbuild=$NEW
	lastrbuild=$OLD
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
        echo "<H2><font color=0080ff>$lastbuild:</font></H2>" >> $RNHOME/$NAME-manifest.html
	if [ -f $TMP/${comp}2.txt ]
	then
                echo "<BR><BR>" >> $RNHOME/$NAME-manifest.html
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
                        echo "<ul>" >> $RNHOME/$NAME-manifest.html
                        echo "<li>" >> $RNHOME/$NAME-manifest.html
                        echo "$de" >> $RNHOME/$NAME-manifest.html
                        echo "<ul>" >> $RNHOME/$NAME-manifest.html

			while read fi
			do

                                echo "<li>" >> $RNHOME/$NAME-manifest.html
                                echo "$fi" >> $RNHOME/$NAME-manifest.html
                                echo "</li>" >> $RNHOME/$NAME-manifest.html
##############
				fi2=`echo $fi | awk '{print $2}'`
				fi2=`echo $fi2 | awk -F "#" '{print $1}'`
				fi2=`p4 where $fi2 | awk '{print $3}'`
				fi2=`echo $fi2 | sed s/$hardpath//g`
				echo "$fi2" >> $RNHOME/$NAME

			done < $TMP/desc.tmp
                        echo "$fi" >> $RNHOME/$NAME-manifest.html
                        echo "</ul>" >> $RNHOME/$NAME-manifest.html
                        echo "</li>" >> $RNHOME/$NAME-manifest.html
                        echo "</ul>" >> $RNHOME/$NAME-manifest.html
		done < $TMP/${comp}2.txt
                echo "<BR><BR>" >> $RNHOME/$NAME-manifest.html
        else echo "<H7>none</H7>" >> $RNHOME/$NAME-manifest.html
	fi
       echo "<BR><HR><BR>" >> $RNHOME/$NAME-manifest.html
echo "</BODY></HTML>" >> $RNHOME/$NAME-manifest.html
cd $HARDPATH

# add version.properties and sapi files to the zip file
echo "version.properties" >> $RNHOME/$NAME

mkdir /tmp/cap
rm -rf /tmp/cap/*
zip -q /tmp/cap/$NAME-diff.zip `cat $RNHOME/$NAME`
cp $RNHOME/$NAME-manifest.html /tmp/cap
cd /tmp/cap
zip -qr $CAPREP/$NAME.zip *
rm -rf /tmp/cap/*
