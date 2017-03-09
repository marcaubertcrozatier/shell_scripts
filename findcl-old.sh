#/bin/sh
if [ -f /home/nsuser/shell/.build ]
	then exit 0
fi
touch /home/nsuser/shell/.build
cd /home/nsuser/shell
P4=/usr/local/bin/p4
P4PORT=gap:1666
P4CLIENT=nutcracker
P4PASSWD=nsuser
export P4PORT P4CLIENT P4PASSWD
#CRIT1="//depot/main/swf"
CRIT1="//depot/main/admin"
CRIT2="//depot/main/build"
CRIT3="//depot/main/channels"
CRIT4="//depot/main/classes"
CRIT5="//depot/main/connectors"
CRIT6="//depot/main/core"
CRIT7="//depot/main/cid"
CRIT8="//depot/main/etc"
CRIT9="//depot/main/isf"
CRIT10="//depot/main/schemaref"
CRIT11="//depot/main/sequencer"
CRIT12="//depot/main/synchronizer"
CRIT13="//depot/main/util"
CRIT14="//depot/main/makefile"
CRIT15="//depot/main/config.mk.in"
CRIT16="//depot/main/cid2cbuloader"
CRIT17="//depot/main/notifyorg"
CRIT18="//depot/main/cbu"
CRIT19="//depot/main/mlx"
CRIT20="//depot/main/qra"
CRIT21="//depot/main/custloader"
CRIT22="//depot/main/jobservice"
CRIT23="//depot/main/reportjob"
oldcl=`grep "OLDCL=" oldcl | awk -F"=" '{print $2}'`
lastcl=`$P4 changes -m 1 -s submitted | awk '{print $2}'`
if [ $oldcl = $lastcl ]
then
	rm -f /home/nsuser/shell/.build >/dev/null
	exit 0
fi
refcl=`expr $oldcl + 1`
$P4 review -c $refcl > cllist
nbcl=`wc cllist | awk '{print $1}'`
cpt=1
while [ $cpt -le $nbcl ]
do
		cl=`head -$cpt cllist | tail -1`
		clnum=`head -$cpt cllist | tail -1 | awk '{print $2}'`
		cpt=`expr $cpt + 1`
		$P4 describe -s $clnum > describecl
		for i in $CRIT1 $CRIT2 $CRIT3 $CRIT4 $CRIT5 $CRIT6 $CRIT7 $CRIT8 $CRIT9 $CRIT10 $CRIT11 $CRIT12 $CRIT13 $CRIT14 $CRIT15 $CRIT16 $CRIT17 $CRIT18 $CRIT19 $CRIT20 $CRIT21 $CRIT22 $CRIT23
		do
		    grep $i describecl >/dev/null
		    if [ $? = 0 ]
		    then echo $cl >> clutil
		  	   break
		    fi
                done
done
if [ ! -f clutil ]
then rm -f /home/nsuser/shell/.build >/dev/null
     rm -f /home/jerusalem2/httpd/html/nutcracker/build >/dev/null
     exit 0
fi
cp clutil /home/jerusalem2/httpd/html/nutcracker/
nt=`date | awk '{print $4}'`
nth=`echo $nt | awk -F":" '{print $1}'`
nth=`expr $nth \* 3600`
ntm=`echo $nt | awk -F":" '{print $2}'`
ntm=`expr $ntm \* 60`
nts=`echo $nt | awk -F":" '{print $3}'`
nts=`expr $nth + $ntm + $nts`
clt=`head -1 describecl | awk '{print $7}'`
clth=`echo $clt | awk -F":" '{print $1}'`
clth=`expr $clth \* 3600`
cltm=`echo $clt | awk -F":" '{print $2}'`
cltm=`expr $cltm \* 60`
clts=`echo $clt | awk -F":" '{print $3}'`
clts=`expr $clth + $cltm + $clts + 300`
echo "DATECL=$clts" > /home/jerusalem2/httpd/html/nutcracker/datecl
if [ $clts -gt $nts ]
then
	rm -f /home/nsuser/shell/.build >/dev/null
	rm -f clutil >/dev/null
	exit 0
fi
lastcl=`tail -1 clutil | awk '{print $2}'`
$P4 sync //depot/main/...@$lastcl > /dev/null
if [ -f clutil.old ]
then cat clutil >> clutil.old
     mv clutil.old clutil
     cp clutil /home/jerusalem2/httpd/html/nutcracker/clutil
     rm -f /home/jerusalem2/httpd/html/nutcracker/clutil.old >/dev/null
fi

touch /home/jerusalem2/httpd/html/nutcracker/build

cat clutil|awk '{print $4}'|sed -e "s/<//" -e "s/>//" > listrecip.txt
touch listbis
for i in `cat listrecip.txt`
do
		grep $i listbis > /dev/null
		if [ $? != 0 ]
		then echo $i >> listbis
		     RECIP="$RECIP $i"
		fi
done
rm listrecip.txt listbis
echo "Suivi de NUTCRACKER : http://jerusalem/cgi-bin/nut.cgi" > mail.txt
echo >> mail.txt
echo "Changelists prises en compte :" >> mail.txt
echo "------------------------------" >> mail.txt
echo >> mail.txt
cat clutil >> mail.txt
echo "OLDCL=$lastcl" > oldcl.new
nt=`date | awk '{print $4}'`
nth=`echo $nt | awk -F":" '{print $1}'`
nth=`expr $nth \* 3600`
ntm=`echo $nt | awk -F":" '{print $2}'`
ntm=`expr $ntm \* 60`
nts=`echo $nt | awk -F":" '{print $3}'`
nts=`expr $nth + $ntm + $nts`
echo "DATEDEBUT=$nts" > /home/jerusalem2/httpd/html/nutcracker/datedebut
cd /home/p4client/main/swf
sh nutbuild.sh
RES=$?
cd /home/nsuser/shell
mv oldcl.new oldcl
cp oldcl /home/jerusalem2/httpd/html/nutcracker/oldcl
if [ $RES = 0 ]
then mail -s "[SF] build NUTCRACKER --> SUCCESS" $RECIP swfmail@netonomy.com smac@netonomy.com < mail.txt
        echo "VALIDCL=$lastcl" > /home/jerusalem2/httpd/html/nutcracker/validcl
        $P4 labelsync -l NUTSUCCESS > /dev/null
        $P4 label -o NUTSUCCESS > label.$$
        cl=" Created bu nsuser. --> $lastcl"
ed -s label.$$ <<!ENDEDIT! > /dev/null
/Created
d
i
$cl
.
w
q
!ENDEDIT!
        $P4 label -i < label.$$
	rm -f clutil label.$$ /home/jerusalem2/httpd/html/nutcracker/clutil >/dev/null
ntf=`date | awk '{print $4}'`
nthf=`echo $ntf | awk -F":" '{print $1}'`
nthf=`expr $nthf \* 3600`
ntmf=`echo $ntf | awk -F":" '{print $2}'`
ntmf=`expr $ntmf \* 60`
ntsf=`echo $ntf | awk -F":" '{print $3}'`
ntsf=`expr $nthf + $ntmf + $ntsf`
durbuild=`expr $ntsf - $nts`
rm -f /home/jerusalem2/httpd/html/nutcracker/durbuild
echo "DURBUILD=$durbuild" > /home/jerusalem2/httpd/html/nutcracker/durbuild
else echo >> mail.txt
     mv clutil clutil.old
     mv /home/jerusalem2/httpd/html/nutcracker/clutil /home/jerusalem2/httpd/html/nutcracker/clutil.old
     cat /home/nsuser/tools/mailerror.txt >> mail.txt
     mail -s "[SF] build NUTCRACKER --> FAILED" $RECIP swfmail@netonomy.com smac@netonomy.com < mail.txt
fi
rm -f /home/nsuser/shell/.build >/dev/null
rm -f /home/jerusalem2/httpd/html/nutcracker/build >/dev/null
rm -f /home/jerusalem2/httpd/html/nutcracker/datedebut >/dev/null
