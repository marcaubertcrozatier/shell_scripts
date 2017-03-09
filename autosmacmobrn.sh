#!/bin/sh
#
#
VERSION=3.5.50-Mstar1.0-21.0
P4=/usr/local/bin/p4
P4PASSWD=nsuser
export P4PASSWD
BUILDS=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/3.5.50-Mstar1.0-19.2
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
ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/$VERSION
SUBJECT="3.5.x build status"
RECIP="Marc.Aubert@comverse.com"
#RECIP="Marc.Aubert@comverse.com,Mohamed.Inelhaj@comverse.com"
#
echo "<HTML>
<HEAD>
  <TITLE>Build status</TITLE>
</HEAD>

<BODY>" > $RNHOME/$VERSION.html
cd $BUILDS
#
for comp in platform ocm css-apps
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
#	lastbuild=`\ls -d cbs-css-$comp2*|grep -v *.zip|grep -v *.html|tail -1`
	lastbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'|tail -1`
	cd $BUILDS
#	lastrbuild=`\ls -d cbs-css-$comp2*|grep -v *.zip|grep -v *.html`
	lastrbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'`
#	firstcl=`\ls -d cbs-css-$comp2*|grep -v *.zip|grep -v *.html|awk -F"-" '{print $7}'`
	firstcl=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'|awk -F"-" '{print $7}'`
	lastcl=`$P4 changes $SRCROOT/$complc/... |head -1|awk '{print $2}'`
	nbcl=`expr $lastcl - $firstcl`
	#
	if [ ! "${nbcl}" = "0" ]
	then $P4 changes -m $nbcl $SRCROOT/$complc/... |grep -v nsuser |grep CBS00 > $TMP/$comp.txt
	else echo none > $TMP/$comp.txt
	fi
done
	#
for comp in platform ocm css-apps
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
#	lastbuild=`\ls -d cbs-css-$comp2*|grep -v *.zip|grep -v *.html|tail -1`
	lastbuild=`find . -type d -name "cbs-css-$comp2*"|awk -F"/" '{print $2}'|tail -1`
	cd $BUILDS
#	lastrbuild=`\ls -d cbs-css-$comp2*|grep -v *.zip|grep -v *.html`
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
#
 	echo "<H2><font color=0080ff>$lastbuild:</font></H2>" >> $RNHOME/$VERSION.html
#
	if [ -f $TMP/${comp}2.txt ]
	then
 	     echo "<BR><BR>" >> $RNHOME/$VERSION.html
#
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
 			echo "<li>" >> $RNHOME/$VERSION.html
			echo "$de" >> $RNHOME/$VERSION.html
 			echo "</li>" >> $RNHOME/$VERSION.html
		done < $TMP/${comp}2.txt
		echo "<BR><BR>" >> $RNHOME/$VERSION.html
	else echo "<H7>none</H7>" >> $RNHOME/$VERSION.html
	fi
	echo "<BR><HR><BR>" >> $RNHOME/$VERSION.html

done


echo "</BODY></HTML>" >> $RNHOME/$VERSION.html
cp $RNHOME/$VERSION.html $RNHOME2/$VERSION.html






