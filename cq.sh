HOME=/home/nsuser/shell
sqlplus CQ_RO/Comverse@cqprdcbs @cqreq "/home/oracle/oracle/product/10.2.0/db_2/oradata/cqprdcbs"|grep -v "All Rights Reserved." |grep -v "Connected to:"|grep -v "With the Partitioning, OLAP and Data Mining options"|grep -v "CBS_MODULE"|grep -v '\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-'|grep -v "SEVERITY	PRIORITY	ID"|grep -v "TITLE"|grep -v "Release 10.2.0.3.0" > fic.txt

rm -f $HOME/cqsmail.txt 
echo "<BR><BR>" >> $HOME/cqsmail.txt
             echo "<TABLE BORDER=1 CELLPADDING=4>" >> $HOME/cqsmail.txt
             echo "<TR  BGCOLOR=DDDDDD>" >> $HOME/cqsmail.txt
             echo "<TH>Module</TH>" >> $HOME/cqsmail.txt
             echo "<TH>Severity</TH>" >> $HOME/cqsmail.txt
             echo "<TH>Priority</TH>" >> $HOME/cqsmail.txt
             echo "<TH>ID</TH>" >> $HOME/cqsmail.txt
             echo "<TH>Title</TH>" >> $HOME/cqsmail.txt
             echo "</TR>" >> $HOME/cqsmail.txt
i=3
while read line
  do
		if [ ! "${line}" = "" ]
		then
			if [ $i -eq 3 ]
			then case $line in
				CSS-Connector4B2C_POS|CSS-Consumer_B2C)i=3;;
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
			echo "<TR BGCOLOR=F6F6F6><TD>$module</TD><TD><CENTER>$severity</CENTER></TD><TD>$priority</TD><TD>$id</TD><TD>$title</TD></TR>" >> $HOME/cqsmail.txt
			fi
			if [ $i -lt 0 ]
			then i=3
			fi
		fi
  done < fic.txt
echo "</TABLE>" >> $HOME/cqsmail.txt
echo "<BR><BR>" >> $HOME/cqsmail.txt
echo "</BODY></HTML>" >> $HOME/cqsmail.txt
email -html -s "TEST CQ" Marc.Aubert@comverse.com < $HOME/cqsmail.txt
