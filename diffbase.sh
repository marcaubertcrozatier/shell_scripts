#!/bin/sh

#########
OLDREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/3.5.50-Mstar-6.5
NEWREP=/home/jerusalem2/sf/cdimages/swf/milestones/3.5.x/3.5.50-Mstar-8.0
#########

HOME=/home/nsuser/shell
RES=/home/nsuser
ROOTINST=/tmp/basediff
DIFFCID=$ROOTINST/platform
DIFFOCM=$ROOTINST/ocm
DIFFAPP=$ROOTINST/apps
OLDPLA=$OLDREP/`ls $OLDREP|grep platform`
NEWPLA=$NEWREP/`ls $NEWREP|grep platform`
OLDOCM=$OLDREP/`ls $OLDREP|grep ocm`
NEWOCM=$NEWREP/`ls $NEWREP|grep ocm`
OLDAPP=$OLDREP/`ls $OLDREP|grep apps`
NEWAPP=$NEWREP/`ls $NEWREP|grep apps`
OLDBUILD=`basename $OLDREP`
NEWBUILD=`basename $NEWREP`

echo "####################################"> $RES/diffres.txt
echo "Diff between $OLDBUILD and $NEWBUILD">> $RES/diffres.txt
echo "####################################">> $RES/diffres.txt
echo >> $RES/diffres.txt

rm -rf $ROOTINST

#########
cd $OLDPLA/cbs-css-rte
cp *linux.bin $HOME/old-cbs-css-rte-linux.bin
cd $HOME
chmod 755 old-cbs-css-rte-linux.bin
echo "DISPLAY=$DISPLAY"
idi=`id`
echo "ID=$idi"
sh old-cbs-css-rte-linux.bin -f instoldpla.conf 
#./old-cbs-css-rte-linux.bin \-f ./instoldpla.conf
#read rep
#rm -f old-cbs-css-rte-linux.bin
exit
cd $NEWPLA/cbs-css-rte
cp *linux.bin $HOME/new-cbs-css-rte-linux.bin
cd $HOME
chmod 755 new-cbs-css-rte-linux.bin
echo "sh ./new-cbs-css-rte-linux.bin -f ./instnewpla.conf"
read rep
rm -f new-cbs-css-rte-linux.bin

echo "########## RTE" >> $RES/diffres.txt
cd $DIFFCID
diff ./old/lib/cid/platform-system-dataset.properties ./new/lib/cid/platform-system-dataset.properties >> $RES/diffres.txt
echo >> $RES/diffres.txt
echo >> $RES/diffres.txt
diff ./old/lib/cid/oracle/datasets/platform/system/dataIn/VERSIONS.csv ./new/lib/cid/oracle/datasets/platform/system/dataIn/VERSIONS.csv >> $RES/diffres.txt

echo >> $RES/diffres.txt
echo >> $RES/diffres.txt
echo >> $RES/diffres.txt
########
mkdir -p $DIFFOCM/old
cd $DIFFOCM/old
unzip $OLDOCM/cbs-css-ocm-loader*.zip

mkdir -p $DIFFOCM/new
cd $DIFFOCM/new
unzip $NEWOCM/cbs-css-ocm-loader*.zip

echo "########## OCM" >> $RES/diffres.txt
cd $DIFFOCM
diff -r old/ocm-loader/setup/admin new/ocm-loader/setup/admin >> $RES/diffres.txt

echo >> $RES/diffres.txt
echo >> $RES/diffres.txt
echo >> $RES/diffres.txt

##########
mkdir -p $DIFFAPP/old
cd $DIFFAPP/old
cp $OLDAPP/cbs-css-apps*.zip .
rm -f cbs-css-apps*packages.zip
fic=`ls`
rm -f $fic
unzip $OLDAPP/$fic

mkdir -p $DIFFAPP/new
cd $DIFFAPP/new
cp $NEWAPP/cbs-css-apps*.zip .
rm -f cbs-css-apps*packages.zip
fic=`ls`
rm -f $fic
unzip $NEWAPP/$fic


echo "########## APPS" >> $RES/diffres.txt
cd $DIFFAPP
diff -r old/db/cid new/db/cid >> $RES/diffres.txt

echo >> $RES/diffres.txt
echo >> $RES/diffres.txt
echo >> $RES/diffres.txt
cd $ROOTINST
#rm -rf $ROOTINST
