#!/bin/sh
#
#
P4=/usr/local/bin/p4
P4PASSWD=nsuser
export P4PASSWD
BUILDS=/home/jerusalem2/sf/cdimages/swf/milestones/301-DIT41-TR4
SRCROOT=//depot/cbs3/301
TMP=/tmp
HOME=/home/nsuser/shell
ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build
SUBJECT="301-DIT4-TR4 build status"
#RECIP="Marc.Aubert@comverse.com"
RECIP="List-Self-Service-Dev@comverse.com,Patrick.Lev@comverse.com,John.Hansen@comverse.com"
#
cd $HOME
if [ -f p4smail.txt ]
then rm -f p4smail.txt
fi
cp 301p4smail.in p4smail.txt
cd $BUILDS
#
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
			  buildrep=$ROOTBUILDREP/CBS3301PLA;;
		ocm) comp2=ocm
		     buildrep=$ROOTBUILDREP/CBS3301OCM;;
		apps) comp2=consumer
		      buildrep=$ROOTBUILDREP/CBS3301APPS/myshapeb2c;;
		ik) comp2=is
		    buildrep=$ROOTBUILDREP/CBS3301APPS/ik;;
	esac
	cd $buildrep
	lastbuild=`\ls -d cbs-css-$comp2*|tail -1`
	cd $BUILDS
	lastrbuild=`\ls -d cbs-css-$comp2*`
	firstcl=`\ls -d cbs-css-$comp2*|awk -F"-" '{print $7}'`
	lastcl=`$P4 changes $SRCROOT/$comp/... |head -1|awk '{print $2}'`
	nbcl=`expr $lastcl - $firstcl`
	#
	if [ ! "${nbcl}" = "0" ]
	then $P4 changes -m $nbcl $SRCROOT/$comp/... |grep -v nsuser > $TMP/$comp.txt
	else echo none > $TMP/$comp.txt
	fi
	#
	while read line
	do
		cl=`echo $line|awk '{print $2}'`
		if [ $cl -gt $firstcl ]
		then echo $line >> $TMP/${comp}2.txt
		fi
	done < $TMP/$comp.txt
#
 	echo "<H2><font color=0080ff>$comp:</font></H2>" >> $HOME/p4smail.txt
 	echo "<li>" >> $HOME/p4smail.txt
 	echo "<B>Last build:</B> $lastbuild" >> $HOME/p4smail.txt
 	echo "</li>" >> $HOME/p4smail.txt
 	echo "<li>" >> $HOME/p4smail.txt
 	echo "<B>Last TR build:</B> $lastrbuild" >> $HOME/p4smail.txt
 	echo "</li>" >> $HOME/p4smail.txt
 	echo "<li>" >> $HOME/p4smail.txt
 	echo "<B>Changelists submited since last TR build:</B>" >> $HOME/p4smail.txt
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







