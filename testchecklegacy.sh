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
SRCBROOT=//depot/cbs3/300
TMP=/tmp
HOME=/home/nsuser/shell
ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build
ROOTRBUILDREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.0.0-DIT41-TR4.7.7
BUILDNAME="3.0.0-DIT41-TR4"
SWFONLY="Marc.Aubert@comverse.com"
ALL="List-Legacy-Self-Care@comverse.com,Steven.Decruynaere@comverse.com,Jean-Christophe.Duwer@comverse.com,Didier.Niel@comverse.com,Shmuel.Solomon@comverse.com"
NewBug=0
#
if [ "$1" = "all" ]
then RECIP="$ALL"
else RECIP="$SWFONLY"
fi
cd $HOME
if [ -f checklegacytmp.txt ]
then rm -f checklegacytmp.txt
fi
if [ -f checklegacymail.txt ]
then rm -f checklegacymail.txt
fi
sed -e "s/!BUILD!/$BUILDNAME/"< checklegacymail.in > checklegacymail.txt

##############################
sqlplus CQ_RO/Comverse@cqprdcbs @testlegacy "/home/oracle/oracle/product/10.2.0/db_2/oradata/cqprdcbs"|grep -v "All Rights Reserved." |grep -v "Connected to:"|grep -v "With the Partitioning, OLAP and Data Mining options"|grep -v "CBS_MODULE"|grep -v '\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-'|grep -v SEVERITY|grep -v PRIORITY|grep -v ID|grep -v "TITLE"|grep -v SERVICE_NAME |grep -v STATE |grep -v SUBMIT_DA|grep -v ASSIGN_TO_FULLNAME|grep -v CUSTOMER_NAME|grep -v "Release 10.2.0.3.0" >checklegacy.txt

echo "<BR><BR>" >> $HOME/checklegacymail.txt
echo "<H2><font color=0080ff> A new CLearQuest Legacy Bug has been submitted:</font></H2>" >> $HOME/checklegacymail.txt
echo "<TABLE BORDER=1 CELLPADDING=4>" >> $HOME/checklegacymail.txt
echo "<TR  BGCOLOR=DDDDDD>" >> $HOME/checklegacymail.txt
echo "<TH>#</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Customer</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Service Name</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Module</TH>" >> $HOME/checklegacymail.txt
echo "<TH>ID</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Title</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Severity</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Priority</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Assign To</TH>" >> $HOME/checklegacymail.txt
echo "<TH>State</TH>" >> $HOME/checklegacymail.txt
echo "<TH>Submit Date</TH>" >> $HOME/checklegacymail.txt
echo "</TR>" >> $HOME/checklegacymail.txt
i=6
nb=1

while read line
  do
                if [ ! "${line}" = "" ]
                then
                        if [ $i -eq 3 ]
                        then case $line in
                                Self-Service* | MyNetonomy*)i=3;;
                                *)i=10;;
                             esac
                        fi
                        if [ $i -eq 1 ]
                        then case $line in
                                CSS*|MyNetonomy* )i=6
                                                  owner=""
                                                  echo "<TR BGCOLOR=F6F6F6><TD>$nb</TD><TD>$customer</TD><TD><CENTER>$sname1 $sname2</CENTER></TD><TD>$module</TD><TD>$id</TD><TD>$title</TD><TD>$severity</TD><TD BGCOLOR=$bgcolor>$priority</TD><TD>$owner</TD><TD>$state</TD><TD>$sdate</TD></TR>" >> $HOME/checklegacymail.txt
                                                  echo $id >> $HOME/checklegacytmp.txt
                                                  nb=`expr $nb + 1`;;
                                *)i=1;;
                             esac
                        fi
                        case $i in
                                6)module=$line;;
                                5)severity=`echo $line|awk '{print $1}'`
                                  priority=`echo $line|awk '{print $2}'`
                                  id=`echo $line|awk '{print $3}'` ;;
                                4)title="${line}";;
                                3)sname1=`echo $line|awk '{print $1}'`
                                  sname2=`echo $line|awk '{print $2}'`
                                  state=`echo $line|awk '{print $3}'`
                                  sdate=`echo $line|awk '{print $4}'` ;;
                                2)customer="${line}";;
                                1)owner="${line}";;
                        esac
			case $priority in
				Immediate)bgcolor=ff0000;;
				High)bgcolor=fd7700;;
				Medium)bgcolor=fdca00;;
				Low)bgcolor=fdfa00;; #gris=F6F6F6;;
			esac
			case $state in
				16777587)state=Submitted;;
				16778051)state=Read4Packaging;;
				16778462)state=Request4Reject;;
				16778325)state=Request4Reproduction;;
			esac
                        i=`expr $i - 1`
                        if [ $i -eq 0 ]
                        then i=6
                             echo "<TR BGCOLOR=F6F6F6><TD>$nb</TD><TD>$customer</TD><TD><CENTER>$sname1 $sname2</CENTER></TD><TD>$module</TD><TD>$id</TD><TD>$title</TD><TD>$severity</TD><TD BGCOLOR=$bgcolor>$priority</TD><TD>$owner</TD><TD>$state</TD><TD>$sdate</TD></TR>" >> $HOME/checklegacymail.txt
			     echo $id >> $HOME/checklegacytmp.txt
                             nb=`expr $nb + 1`
			fi
                        if [ $i -lt 0 ]
                        then i=6
                        fi
                        if [ $i -eq 9 ]
                        then i=3
                        fi
                fi
  done < checklegacy.txt
#if [ ${lastbug}=${id} ]
#then exit
#fi
########################
while read bugid
  do
	lastbug=`grep $bugid $HOME/.lastlegacybug.txt|head -1`
	if [ "${lastbug}" ]
	then grep -v $bugid $HOME/checklegacymail.txt > $HOME/checklegacymail2.txt
            mv $HOME/checklegacymail2.txt $HOME/checklegacymail.txt
	else echo "$bugid" >> $HOME/.lastlegacybug.txt
	     NewBug=1
	fi
  done < $HOME/checklegacytmp.txt
if [ $NewBug = 0 ]
then exit
fi
########################
SUBJECT="New Clearquest Legacy Bugs have been submitted"

echo "</TABLE>" >> $HOME/checklegacymail.txt
echo "<BR>" >> $HOME/checklegacymail.txt
#
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
style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>" >> $HOME/checklegacymail.txt

#
echo "</BODY></HTML>" >> $HOME/checklegacymail.txt
email -html -s "$SUBJECT" $RECIP < $HOME/checklegacymail.txt







