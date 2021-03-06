#!/bin/sh
#
#
ORACLE_HOME=/home/oracle/oracle/product/10.2.0/db_2
export ORACLE_HOME
PATH=$PATH:$ORACLE_HOME/bin
export PATH
P4=/usr/local/bin/p4
P4PASSWD=nsuser
export P4PASSWD
#BUILDS=/home/jerusalem2/sf/cdimages/swf/milestones/RA-DIT41-TR3.16
BUILDS=/home/jerusalem2/sf/cdimages/swf/cdimages/build
SRCROOT=//depot/ccbs
SRCBROOT=//depot/cbs3/3.0.11
TMP=/tmp
HOME=/home/nsuser/shell
ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build
ROOTRBUILDREP=/home/jerusalem2/sf/cdimages/swf/milestones/GA3-3.0.15-1.2
BUILDNAME="GA3-3.0.15"
SUBJECT="$BUILDNAME build status"
SWFONLY="Marc.Aubert@comverse.com"
#SWFONLY="Marc.Aubert@comverse.com,Nicolas.Derycke@comverse.com"
ALL="List-Self-Service-Dev@comverse.com"
#ALL="List-Self-Service-Dev@comverse.com,SelfServicePQA@comverse.com"
#
if [ "$1" = "all" ]
then RECIP="$ALL"
else RECIP="$SWFONLY"
fi
cd $HOME
if [ -f p4smail.txt ]
then rm -f p4smail.txt
fi
sed -e "s/!BUILD!/$BUILDNAME/"< p4smail.in > p4smail.txt

##############################
for branch in GA
do
sed -e "s/!BRANCH!/$branch/" \
< $HOME/cqreq.sql.in > cqreq.sql
sqlplus CQ_RO/Comverse@cqprdcbs @cqreq "/home/oracle/oracle/product/10.2.0/db_2/oradata/cqprdcbs"|grep -v "All Rights Reserved." |grep -v "Connected to:"|grep -v "With the Partitioning, OLAP and Data Mining options"|grep -v "CBS_MODULE"|grep -v '\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-'|grep -v "SEVERITY	PRIORITY	ID"|grep -v "TITLE"|grep -v "Release 10.2.0.3.0" >fic.txt

echo "<BR><BR>" >> $HOME/p4smail.txt
echo "<H1><font color=0080ff>$branch ClearQuest Bugs with READY4PACKAGING status:</font></H2>" >> $HOME/p4smail.txt
echo "<TABLE BORDER=1 CELLPADDING=4>" >> $HOME/p4smail.txt
echo "<TR  BGCOLOR=DDDDDD>" >> $HOME/p4smail.txt
echo "<TH>Module</TH>" >> $HOME/p4smail.txt
echo "<TH>Severity</TH>" >> $HOME/p4smail.txt
echo "<TH>Priority</TH>" >> $HOME/p4smail.txt
echo "<TH>ID</TH>" >> $HOME/p4smail.txt
echo "<TH>Title</TH>" >> $HOME/p4smail.txt
echo "</TR>" >> $HOME/p4smail.txt
i=3
while read line
  do
                if [ ! "${line}" = "" ]
                then
                        if [ $i -eq 3 ]
                        then case $line in
                                CSS-*)i=3;;
                                *)i=0;;
                             esac
                        fi
                        case $i in
                                3)module=$line;;
                                2)severity=`echo $line|awk '{print $1}'`
                                  priority=`echo $line|awk '{print $2}'`
                                  id=`echo $line|awk '{print $3}'` ;;
                                1)title="${line}";;
                        esac
                        i=`expr $i - 1`
                        if [ $i -eq 0 ]
                        then i=3
                        echo "<TR BGCOLOR=F6F6F6><TD>$module</TD><TD><CENTER>$severity</CENTER></TD><TD>$priority</TD><TD>$id</TD><TD>$title</TD></TR>" >> $HOME/p4smail.txt
                        fi
                        if [ $i -lt 0 ]
                        then i=3
                        fi
                fi
  done < fic.txt
echo "</TABLE>" >> $HOME/p4smail.txt
echo "<BR><BR>" >> $HOME/p4smail.txt
echo "<BR><HR><BR>" >> $HOME/p4smail.txt
done
##############################
# CLEARQUEST bugs submited on main branch

cd $BUILDS
#
echo "<H1><font color=0080ff>CLEARQUEST bugs submited on main branch and not reported on $BUILDNAME branch</font></H2>" >> $HOME/p4smail.txt
for comp in platform ocm apps ik
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
			  buildrep=$ROOTBUILDREP/CCBSPLATFORM
			  buildbrep=$ROOTBUILDREP/CBS33.0.15PLA;;
		ocm) comp2=ocm
		     buildrep=$ROOTBUILDREP/CCBSOCM
		     buildbrep=$ROOTBUILDREP/CBS33.0.15OCM;;
		apps) comp2=consumer
		      buildrep=$ROOTBUILDREP/CCBSAPPS/myshapeb2c
		      buildbrep=$ROOTBUILDREP/CBS33.0.15APPS/myshapeb2c;;
		ik) comp2=is
		    buildrep=$ROOTBUILDREP/CCBSAPPS/ik
		    buildbrep=$ROOTBUILDREP/CBS33.0.15APPS/ik;;
	esac
	cd $buildrep
	lastbuild=`\ls -d cbs-css-$comp2*|sort -t"-" -k 7,7|tail -1`
	cd $buildbrep
	lastbbuild=`\ls -d cbs-css-$comp2*|sort -t"-" -k 7,7|tail -1`
	cd $ROOTRBUILDREP
	typeset -i firstcl=`\ls -d cbs-css-$comp2*|sort -t"-" -k 7,7|tail -1|awk -F"-" '{print $7}'`
	typeset -i lastcl=`$P4 changes $SRCROOT/$comp/... |head -1|awk '{print $2}'`
	typeset -i nbcl=`expr $lastcl - $firstcl`
	#
	if [ ! "${nbcl}" = "0" ]
	then $P4 changes -m $nbcl $SRCROOT/$comp/... |grep -v nsuser |grep -v "SWF:SWF"|grep CBS000 > $TMP/$comp.txt
	else echo none > $TMP/$comp.txt
	fi
	$P4 changes $SRCBROOT/$comp/... |grep -v nsuser |grep -v "SWF:SWF"|grep CBS000 > $TMP/$bcomp.txt
	#
	while read line
	do
		cl=`echo $line|awk '{print $2}'`
		if [ $cl -gt $firstcl ]
		then bline=`grep "SWF:$cl" $TMP/$bcomp.txt`
		     bbline=`grep "CL:$cl" $TMP/$bcomp.txt`
                     if [ "$bline" = "" -a "$bbline" = "" ]
		     then echo $line >> $TMP/${comp}2.txt
		     fi
		fi
	done < $TMP/$comp.txt
#
 	echo "<H2><font color=0080ff>$comp:</font></H2>" >> $HOME/p4smail.txt
# 	echo "<li>" >> $HOME/p4smail.txt
# 	echo "<B>Last build on main branch:</B> $lastbuild" >> $HOME/p4smail.txt
 	echo "</li>" >> $HOME/p4smail.txt
 	echo "<li>" >> $HOME/p4smail.txt
 	echo "<B>Last build on $BUILDNAME branch:</B> $lastbbuild" >> $HOME/p4smail.txt
 	echo "</li>" >> $HOME/p4smail.txt
 	echo "<li>" >> $HOME/p4smail.txt
 	echo "<B>Changelists submited since last $BUILDNAME build:</B>" >> $HOME/p4smail.txt
 	echo "</li>" >> $HOME/p4smail.txt
#
	if [ -f $TMP/${comp}2.txt ]
	then
 	     echo "<BR><BR>" >> $HOME/p4smail.txt
	     echo "<TABLE BORDER=1 CELLPADDING=4>" >> $HOME/p4smail.txt 
 	     echo "<TR  BGCOLOR=DDDDDD>" >> $HOME/p4smail.txt
     	     echo "<TH>Change</TH>" >> $HOME/p4smail.txt
     	     echo "<TH>Date</TH>" >> $HOME/p4smail.txt
     	     echo "<TH>Author</TH>" >> $HOME/p4smail.txt
     	     echo "<TH>Description</TH>" >> $HOME/p4smail.txt
  	     echo "</TR>" >> $HOME/p4smail.txt
#
		sort -r -n $TMP/${comp}2.txt > $TMP/${comp}3.txt
		mv $TMP/${comp}3.txt $TMP/${comp}2.txt
		while read line
		do
			cl=`echo $line|awk '{print $2}'`
			da=`echo $line|awk '{print $4}'`
			au=`echo $line|awk '{print $6}'`
			$P4 change -o $cl > $TMP/change.tmp
			typeset -i nbl=`wc -l $TMP/change.tmp|awk '{print $1}'`
			typeset -i rl=`expr $nbl - 25`
			de=`tail -$rl $TMP/change.tmp|sed -e "s/\t//"`
			echo "<TR BGCOLOR=F6F6F6><TD>$cl</TD><TD><CENTER>$da</CENTER></TD><TD>$au</TD><TD>$de</TD></TR>" >> $HOME/p4smail.txt
		done < $TMP/${comp}2.txt
		echo "</TABLE>" >> $HOME/p4smail.txt
		echo "<BR><BR>" >> $HOME/p4smail.txt
	else echo "<H7>none</H7>" >> $HOME/p4smail.txt
	fi
	echo "<BR><HR><BR>" >> $HOME/p4smail.txt

done


#
echo "<p class=MsoNormal style='margin-left:.5in'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'><o:p>&nbsp;</o:p></span></font></p>

<p class=MsoNormal><font size=2 color=black face=Arial><span style='font-size:
10.0pt;font-family:Arial;color:black'><o:p>&nbsp;</o:p></span></font></p>

<p style='margin-bottom:12.0pt'><font size=2 color=gray face="Times New Roman"><span
lang=FR style='font-size:10.0pt;color:gray'>--</span></font><font size=2><span
lang=FR style='font-size:10.0pt'><br>
<strong><b><font color="#0080ff" face="Times New Roman"><span style='color:
#0080FF'>Marc AUBERT</span></font></b></strong><br>
<font color=gray><span style='color:gray'>Configuration Management - Build
process<br>
Converged Billing Solutions<br>
<strong><b><font face="Times New Roman">Comverse France</font></b></strong><br>
Tour Franklin - 100 terrasse Boieldieu<br>
92042 Paris-la-Dénse - France<br>
Office: +33 155 67 9212<br>
Marc.Aubert@comverse.com</span></font><br>
</span></font><a href="http://www.comverse.com"><span lang=FR>http://www.comverse.com</span></a><span
lang=FR><o:p></o:p></span></p>

<p class=MsoNormal><font size=3 face="Times New Roman"><span lang=FR
style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>" >> $HOME/p4smail.txt

#
echo "</BODY></HTML>" >> $HOME/p4smail.txt
email -html -s "$SUBJECT" $RECIP < $HOME/p4smail.txt







