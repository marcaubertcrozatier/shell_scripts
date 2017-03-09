#!/bin/sh
#
#
# changement automatique de jar single API
#
#
export REF=/space/nsuser/p4client/ccbs/swf/ikjars
export P4CLIENT=ccbsswfik
export P4PORT=perforce:1666
export P4PASSWD=nsuser
export P4=/usr/local/bin/p4
export RECIP="Arnaud.Nicklaus@comverse.com,Didier.Niel@comverse.com,Marc.Aubert@comverse.com,Alexandre.Lenoir@comverse.com,Loic.Brossard@comverse.com,Frederic.Moitel@comverse.com,Delphine.Denis@comverse.com,Mohamed.Inelhaj@comverse.com"
export RECIP2="Marc.Aubert@comverse.com,Matthieu.Nguyen@comverse.com,Ilya.pachkine@comverse.com,Dmitry.Strelbytsky@comverse.com,Mark.Young@comverse.com,Jeanne.Tsui@comverse.com,Lori.Wang@comverse.com,Ron.deVera@comverse.com,Harry.Schonberger@comverse.com,John.Nguyen@comverse.com,Linan.Su@comverse.com,Hua.Liu@comverse.com,Peter.Tran@comverse.com,Kenneth.Tang@comverse.com,Mark.Ganter@comverse.com,yu.mao@comverse.com"

cd $REF
$P4 edit *.jar
wget http://maven.kenan.com:8020/sapi_repo/com/comverse/api/csm/ccbs-csm-shared/1.0.M1-SNAPSHOT/ccbs-csm-shared-1.0.M1-SNAPSHOT.jar
wget http://maven.kenan.com:8020/sapi_repo/com/comverse/api/onlinepc/ccbs-onlinepc-shared/1.0.M1-SNAPSHOT/ccbs-onlinepc-shared-1.0.M1-SNAPSHOT.jar
wget http://maven.kenan.com:8020/sapi_repo/com/comverse/api/framwork/ccbs-base/1.0.M1-SNAPSHOT/ccbs-base-1.0.M1-SNAPSHOT.jar
wget http://maven.kenan.com:8020/sapi_repo/com/comverse/api/sandbox/ccbs-sandbox-shared/1.0.M1-SNAPSHOT/ccbs-sandbox-shared-1.0.M1-SNAPSHOT.jar
chmod 666 *
clnum=`$P4 change -i < /home/nsuser/shell/p4specif_ccbsjarref.in|awk '{print $2}'`
$P4 submit -c $clnum
