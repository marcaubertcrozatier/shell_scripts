//depot/platform/main/channels/src/com/netonomy/jfn/InternalPageFlow.java#2 - updating /space/nut/platform/main/channels/src/com/netonomy/jfn/InternalPageFlow.java
//depot/platform/main/core/samples/addinfo/config/nmycfg/dal/instances/db2/core_queries_custom.xml#4 - added as /space/nut/platform/main/core/samples/addinfo/config/nmycfg/dal/instances/db2/core_queries_custom.xml
//depot/platform/main/core/samples/addinfo/config/nmycfg/dal/instances/mssql/core_queries_custom.xml#4 - added as /space/nut/platform/main/core/samples/addinfo/config/nmycfg/dal/instances/mssql/core_queries_custom.xml
//depot/platform/main/core/samples/addinfo/config/nmycfg/dal/instances/oracle/core_queries_custom.xml#4 - added as /space/nut/platform/main/core/samples/addinfo/config/nmycfg/dal/instances/oracle/core_queries_custom.xml
//depot/platform/main/swf/measurespecif.in#2 - added as /space/nut/platform/main/swf/measurespecif.in
//depot/platform/main/swf/netonobuild.sh#38 - added as /space/nut/platform/main/swf/netonobuild.sh
//depot/platform/main/swf/p4specif.in#3 - added as /space/nut/platform/main/swf/p4specif.in

make clean...OK.
make all...OK.
make deploy...OK.


make test...
make clean...latform/demo/build
+ CRIT28=//depot/platform/demo/channels
+ CRIT29=//depot/platform/demo/connectors
+ CRIT30=//depot/platform/demo/core
+ CRIT31=//depot/platform/demo/cid
+ CRIT32=//depot/platform/demo/etc
+ CRIT33=//depot/platform/demo/synchronizer
+ CRIT34=//depot/platform/demo/makefile
+ CRIT35=//depot/platform/demo/config.mk.in
+ CRIT36=//depot/platform/demo/qra
+ CRIT37=//depot/platform/demo/reportjob
+ CRIT38=//depot/platform/demo/custloader
+ CRIT39=//depot/platform/demo/cbu
+ CRIT40=//depot/platform/demo/etl
+ CRIT41=//depot/platform/demo/workspace
++ grep OLDCL= oldcl
++ awk -F= '{print $2}'
+ oldcl=54799
++ /usr/local/bin/p4 changes -m 1 -s submitted
++ awk '{print $2}'
+ lastcl=54802
+ '[' 54799 = 54802 ']'
++ expr 54799 + 1
+ refcl=54800
+ /usr/local/bin/p4 review -c 54800
++ wc cllist
++ awk '{print $1}'
+ nbcl=3
+ cpt=1
+ '[' 1 -le 3 ']'
++ head -1 cllist
++ tail -1
+ cl=Change 54800 anicklaus <arnaud.nicklaus@netonomy.com> (anicklaus)
++ head -1 cllist
++ tail -1
++ awk '{print $2}'
+ clnum=54800
++ expr 1 + 1
+ cpt=2
+ /usr/local/bin/p4 describe -s 54800
+ grep //depot/platform/main/admin describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/build describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/channels describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/classes describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/connectors describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/core describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/cid describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/etc describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/isf describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/schemaref describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/sequencer describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/synchronizer describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/util describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/makefile describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/config.mk.in describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/cid2cbuloader describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/notifyorg describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/cbu describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/mlx describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/qra describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/custloader describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/jobservice describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/reportjob describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/studios describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/build.xml describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/etl describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/build describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/channels describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/connectors describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/core describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/cid describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/etc describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/synchronizer describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/makefile describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/config.mk.in describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/qra describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/reportjob describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/custloader describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/cbu describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/etl describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/workspace describecl
+ '[' 1 = 0 ']'
+ '[' 2 -le 3 ']'
++ head -2 cllist
++ tail -1
+ cl=Change 54801 nsuser <smac@netonomy.com> (nsuser)
++ head -2 cllist
++ tail -1
++ awk '{print $2}'
+ clnum=54801
++ expr 2 + 1
+ cpt=3
+ /usr/local/bin/p4 describe -s 54801
+ grep //depot/platform/main/admin describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/build describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/channels describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/classes describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/connectors describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/core describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/cid describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/etc describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/isf describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/schemaref describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/sequencer describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/synchronizer describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/util describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/makefile describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/config.mk.in describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/cid2cbuloader describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/notifyorg describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/cbu describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/mlx describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/qra describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/custloader describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/jobservice describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/reportjob describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/studios describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/build.xml describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/etl describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/build describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/channels describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/connectors describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/core describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/cid describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/etc describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/synchronizer describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/makefile describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/config.mk.in describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/qra describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/reportjob describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/custloader describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/cbu describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/etl describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/demo/workspace describecl
+ '[' 1 = 0 ']'
+ '[' 3 -le 3 ']'
++ head -3 cllist
++ tail -1
+ cl=Change 54802 gcollin <gcollin@netonomy.com> (gcollin)
++ head -3 cllist
++ tail -1
++ awk '{print $2}'
+ clnum=54802
++ expr 3 + 1
+ cpt=4
+ /usr/local/bin/p4 describe -s 54802
+ grep //depot/platform/main/admin describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/build describecl
+ '[' 1 = 0 ']'
+ grep //depot/platform/main/channels describecl
+ '[' 0 = 0 ']'
+ echo Change 54802 gcollin '<gcollin@netonomy.com>' '(gcollin)'
+ break
+ '[' 4 -le 3 ']'
+ '[' '!' -f clutil ']'
+ cp clutil /home/jerusalem2/httpd/html/nutcracker/
++ date
++ awk '{print $4}'
+ nt=14:08:08
++ echo 14:08:08
++ awk -F: '{print $1}'
+ nth=14
++ expr 14 '*' 3600
+ nth=50400
++ echo 14:08:08
++ awk -F: '{print $2}'
+ ntm=08
++ expr 08 '*' 60
+ ntm=480
++ echo 14:08:08
++ awk -F: '{print $3}'
+ nts=08
++ expr 50400 + 480 + 08
+ nts=50888
++ head -1 describecl
++ awk '{print $7}'
+ clt=14:07:48
++ echo 14:07:48
++ awk -F: '{print $1}'
+ clth=14
++ expr 14 '*' 3600
+ clth=50400
++ echo 14:07:48
++ awk -F: '{print $2}'
+ cltm=07
++ expr 07 '*' 60
+ cltm=420
++ echo 14:07:48
++ awk -F: '{print $3}'
+ clts=48
++ expr 50400 + 420 + 48 + 300
+ clts=51168
+ echo DATECL=51168
++ tail -1 clutil
++ awk '{print $2}'
+ lastcl=54802
+ /usr/local/bin/p4 sync //depot/platform/main/...@54802
+ /usr/local/bin/p4 sync //depot/platform/demo/...@54802
+ /usr/local/bin/p4 sync //depot/cd-image/...@54802
+ '[' -f clutil.old ']'
+ touch /home/jerusalem2/httpd/html/nutcracker/build
+ cat clutil
+ awk '{print $4}'
+ sed -e 's/<//' -e 's/>//'
+ touch listbis
++ cat listrecip.txt
+ grep gcollin@netonomy.com listbis
+ '[' 1 '!=' 0 ']'
+ echo gcollin@netonomy.com
+ RECIP=,gcollin@netonomy.com
+ rm listrecip.txt listbis
+ echo 'Suivi de NUTCRACKER : http://jerusalem/cgi-bin/nut.cgi'
+ echo
+ echo 'Changelists prises en compte :'
+ echo ------------------------------
+ echo
+ cat clutil
+ echo OLDCL=54802
++ date
++ awk '{print $4}'
+ nt=14:08:10
++ echo 14:08:10
++ awk -F: '{print $1}'
+ nth=14
++ expr 14 '*' 3600
+ nth=50400
++ echo 14:08:10
++ awk -F: '{print $2}'
+ ntm=08
++ expr 08 '*' 60
+ ntm=480
++ echo 14:08:10
++ awk -F: '{print $3}'
+ nts=10
++ expr 50400 + 480 + 10
+ nts=50890
+ echo DATEDEBUT=50890
+ cd /space/nsuser/p4client/platform/main/swf/nutcracker
+ sh nut_build.sh
+ f/nutcracker
/space/nut/platform/main/swf/nutcracker/nut_findcl.sh: line 167: f/nutcracker: No such file or directory
+ sh nut_build.sh
+ RES=1
+ cd /home/nsuser/shell
+ mv oldcl.new oldcl
+ cp oldcl /home/jerusalem2/httpd/html/nutcracker/oldcl
+ '[' 1 = 0 ']'
+ echo
+ mv clutil clutil.old
+ mv /home/jerusalem2/httpd/html/nutcracker/clutil /home/jerusalem2/httpd/html/nutcracker/clutil.old
+ cat /home/nsuser/tools/nutoramailerror.txt
