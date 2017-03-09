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
TMP=/tmp
HOME=/home/nsuser/shell
ROOTBUILDREP=/home/jerusalem2/sf/cdimages/swf/cdimages/build
ROOTRBUILDREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.0.0-DIT41-TR4.7.7
BUILDNAME="3.0.0-DIT41-TR4"
SUBJECT="Clearquest B2C Bugs status"
LINK="http://us-dnv-cquest/cqweb/main?command=GenerateMainFrame&service=CQ&schema=VCNTR&contextid=CBS&entityID=!DBID!&entityDefName=CBS_Defect"
SWFONLY="Marc.Aubert@comverse.com,Mohamed.Inelhaj@comverse.com"
ALL="Marc.Aubert@comverse.com"
#
if [ "$1" = "all" ]
then RECIP="$ALL"
else RECIP="$SWFONLY"
fi
cd $HOME
if [ -f bb2cmail.txt ]
then rm -f bb2cmail.txt
fi
if [ -f .lastbb2cbug.txt ]
then rm -f .lastbb2cbug.txt
fi
touch .lastbb2cbug.txt
sed -e "s/!BUILD!/$BUILDNAME/"< bb2cmail.in > bb2cmail.txt
#
#
# PR DEFECT_TYPE
#
#
##############################
sqlplus CQ_RO/Comverse@cqprdcbs @bb2c "/home/oracle/oracle/product/10.2.0/db_2/oradata/cqprdcbs"|grep -v "All Rights Reserved." |grep -v "Connected to:"|grep -v "With the Partitioning, OLAP and Data Mining options"|grep -v "CBS_MODULE"|grep -v '\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-'|grep -v SEVERITY|grep -v PRIORITY|grep -v ID|grep -v "TITLE"|grep -v SERVICE_NAME |grep -v STATE |grep -v SUBMIT_DA|grep -v ASSIGN_TO_FULLNAME|grep -v CUSTOMER_NAME|grep -v DBID|grep -v "Release 10.2.0.3.0"|grep -v NAME >bb2c.txt
##############################
echo "<BR><BR>" >> $HOME/bb2cmail.txt
echo "<H2><font color=0080ff>ClearQuest B2C PR status:</font></H2>" >> $HOME/bb2cmail.txt
echo "<TABLE BORDER=1 CELLPADDING=4>" >> $HOME/bb2cmail.txt
echo "<TR  BGCOLOR=DDDDDD>" >> $HOME/bb2cmail.txt
echo "<TH>#</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Customer</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Service</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Module</TH>" >> $HOME/bb2cmail.txt
echo "<TH>ID</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Title</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Severity</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Priority</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Assign To</TH>" >> $HOME/bb2cmail.txt
echo "<TH>State</TH>" >> $HOME/bb2cmail.txt
echo "<TH>Submit Date</TH>" >> $HOME/bb2cmail.txt
echo "</TR>" >> $HOME/bb2cmail.txt
i=7
nb=1
LAST=0
while read line
  do
                if [ ! "${line}" = "" ]
                then
                        if [ $i -eq 4 ]
                        then case $line in
                                "Self Service" | Self-Service* | MyNetonomy*)i=4;;
                                *)i=10;;
                             esac
                        fi
                        if [ $i -eq 1 ]
                        then case $line in
                                CSS*|MyNetonomy* )i=7
						  owner=""
						  echo "<TR BGCOLOR=F6F6F6><TD>$nb</TD><TD>$customer</TD><TD><CENTER>$sname1 $sname2</CENTER></TD><TD>$module</TD><TD>$id</TD><TD>$title</TD><TD>$severity</TD><TD BGCOLOR=$bgcolor>$priority</TD><TD>$owner</TD><TD>$state</TD><TD>$sdate</TD></TR>" >> $HOME/bb2cmail.txt
                             			  echo $id >> $HOME/.lastbb2cbug.txt
                             			  nb=`expr $nb + 1`;;
                                *)i=1;;
                             esac
                        fi
                        case $i in
                                7)module=$line;;
                                6)severity=`echo $line|awk '{print $1}'`
                                  priority=`echo $line|awk '{print $2}'`
                                  id=`echo $line|awk '{print $3}'` ;;
                                5)title="${line}";;
                                4)sname1=`echo $line|awk '{print $1}'`
                                  sname2=`echo $line|awk '{print $2}'`
                                  state=`echo $line|awk '{print $3}'`
                                  sdate=`echo $line|awk '{print $4}'` ;;
                                3)state="${line}";;
                                2)customer=`echo $line|awk '{print $3}'`
                                  nstate=`echo $line|awk '{print $1}'`
                                  sdate=`echo $line|awk '{print $2}'` ;;
                                1)ptest=`echo ${line}|awk '{print $2}'`
                                  if [ "$ptest" = "" ]
				  then dbid=`echo ${line}|awk '{print $1}'`
                                       owner=""
                                  else dbid=`echo ${line}|awk '{print $3}'`
                                       owner1=`echo $line|awk '{print $1}'`
                                       owner2=`echo $line|awk '{print $2}'`
                                       owner="$owner1 $owner2"
				  fi;;
                        esac
			case $priority in
				Immediate)bgcolor=ff0000;;
				High)bgcolor=fd7700;;
				Medium)bgcolor=fdca00;;
				Low)bgcolor=fdfa00;; #gris=F6F6F6;;
			esac
#			case $state in
#				16777587)state=Submitted;;
#				16778736)state=Read4Packaging;;
#				16778188)state=Read4Verification;;
#				16778051)state=Waiting4Solution;;
#				16778462)state=Request4Reject;;
#				16778325)state=Request4Reproduction;;
#			esac
                        i=`expr $i - 1`
                        if [ $i -eq 0 ]
                        then i=7
			     link=`echo $LINK|sed -e "s/!DBID!/$dbid/"`
                             echo "<TR BGCOLOR=F6F6F6><TD>$nb</TD><TD>$customer</TD><TD><CENTER>$sname1 $sname2</CENTER></TD><TD>$module</TD><TD><a href=$link>$id</a></TD><TD>$title</TD><TD>$severity</TD><TD BGCOLOR=$bgcolor>$priority</TD><TD>$owner</TD><TD>$state</TD><TD>$sdate</TD></TR>" >> $HOME/bb2cmail.txt
			     echo $id >> $HOME/.lastbb2cbug.txt
                             nb=`expr $nb + 1`
                        fi
                        if [ $i -lt 0 ]
                        then i=7
                        fi
                        if [ $i -eq 9 ]
                        then i=4
                        fi
                fi
  done < bb2c.txt
echo "</TABLE>" >> $HOME/bb2cmail.txt
#
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
style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>" >> $HOME/bb2cmail.txt

#
echo "</BODY></HTML>" >> $HOME/bb2cmail.txt
email -html -s "$SUBJECT" $RECIP < $HOME/bb2cmail.txt







