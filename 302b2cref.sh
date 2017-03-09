#!/bin/sh
#
#
# Changement automatique de plateforme de reference
#
#
export REFDIR=/home/jerusalem2/sf/cdimages/swf/builds/302_b2c_reference
export BUILDDIR=/home/jerusalem2/sf/cdimages/swf/cdimages/build/CBS3302APPS/myshapeb2c
export REF=/space/nsuser/p4client/cbs3/302/swf/apps
export P4CLIENT=302b2c_fan
export P4PORT=perforce:1666
export P4PASSWD=nsuser
export P4=/usr/local/bin/p4
export RECIP="Marc.Aubert@comverse.com"
export RECIP2="Marc.Aubert@comverse.com"
#export RECIP="Arnaud.Nicklaus@comverse.com,Marc.Aubert@comverse.com,Alexandre.Lenoir@comverse.com,Mohamed.Inelhaj@comverse.com,Laurent.Kubaski@comverse.com,SelfServicePQA@comverse.com"
#export RECIP2="Marc.Aubert@comverse.com,Matthieu.Nguyen@comverse.com,Mark.Young@comverse.com,Harry.Schonberger@comverse.com,John.Nguyen@comverse.com,Linan.Su@comverse.com,Hua.Liu@comverse.com,Kenneth.Tang@comverse.com,Canh.Tran@comverse.com"

#
# Copie de la nouvelle reference sur jerusalem
#
echo;echo;echo "#######################"
cd $REFDIR
old_ref=`ls -d cbs-css-consumer-302-*|sort -n -t"-" -k 3,3|tail -1`
cd $BUILDDIR
new_ref=`ls -d cbs-css-consumer-302-*|sort -n -t"-" -k 3,3|tail -1`
num_ref=`echo $new_ref | awk -F"-" '{print $5}'`
echo "Ancienne reference : $old_ref"
echo "Nouvelle reference : $new_ref"
if [ "${old_ref}" = "${new_ref}" ]
then echo "Pas de nouvelle reference sur jerusalem"
     exit
fi
echo "Copie de la nouvelle reference sur jerusalem"
cd $REFDIR
cp -r $BUILDDIR/$new_ref .
echo "Effacement ancienne reference"
rm -rf $old_ref

#
# Edition perforce du fichier reference.properties
#
echo;echo;echo "#######################"
echo "Edition perforce du fichier reference.properties"
echo
cd $REF
$P4 edit reference.properties
clnum=`$P4 change -i < /home/nsuser/shell/p4specif_302ref.in|awk '{print $2}'`
grep -v B2CSupportedBuild= reference.properties > reference.properties.tmp
echo "B2CSupportedBuild=$num_ref" >> reference.properties.tmp
mv reference.properties.tmp reference.properties
$P4 submit -c $clnum

#
# Envoi du mail
#
echo;echo;echo "#######################"
echo "Envoi du mail"
echo
subject="Nouvelle reference 302B2C : $num_ref"
sed -e "s/!NUM_REF!/$num_ref/" \
< /home/nsuser/shell/302refb2c.in > /home/nsuser/shell/302refb2c.txt
email -s "${subject}" $RECIP < /home/nsuser/shell/302refb2c.txt

############################



echo "Copie de la nouvelle reference sur proxytc01-xp.csg.csgsystems.com"
cd $BUILDDIR
zip -b . -qr /home/nsuser/tmpftp/$new_ref $new_ref/*
cd /home/nsuser/tmpftp

ftp -i <<!END!
open proxytc01-xp.csg.csgsystems.com
bin
cd 302_b2c_reference
mput ${new_ref}.zip
quit
!END!
rm -f /home/nsuser/tmpftp/${new_ref}.zip
#cp -r ../build/CCBSPLATFORM/$new_ref .
#echo "Effacement ancienne reference sur ngum01-xp.csg.csgsystems.com"
#
# Envoi du mail
#
echo;echo;echo "#######################"
echo "Envoi du mail"
echo
subject="New 302 B2C reference : $num_ref"
sed -e "s/!NUM_REF!/$num_ref/" \
< /home/nsuser/shell/302ref2b2c.in > /home/nsuser/shell/302ref2b2c.txt
email -s "${subject}" $RECIP2 < /home/nsuser/shell/302ref2b2c.txt
############################
