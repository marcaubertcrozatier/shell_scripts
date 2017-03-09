#!/bin/sh
#
#
# Changement automatique de plateforme de reference
#
#
export REFDIR=/home/jerusalem2/sf/cdimages/swf/builds/300_platform_reference
export BUILDDIR=/home/jerusalem2/sf/cdimages/swf/builds/build/CBS33.0.0PLA
export REF=/space/nsuser/p4client/cbs3/3.0.0/swf/apps
export P4CLIENT=300b2c_fan
export P4PORT=perforce:1666
export P4PASSWD=nsuser
export P4=/usr/local/bin/p4
export RECIP="List-Self-Service-Dev@comverse.com"
export RECIP2="Marc.Aubert@comverse.com,Matthieu.Nguyen@comverse.com,Mark.Young@comverse.com,Harry.Schonberger@comverse.com,Linan.Su@comverse.com,Hua.Liu@comverse.com,Kenneth.Tang@comverse.com,Wendy.Guo@comverse.com,Canh.Tran@comverse.com,asit.singh@comverse.com"

#
# Copie de la nouvelle reference sur jerusalem
#
echo;echo;echo "#######################"
cd $REFDIR
old_ref=`ls -d cbs-css-platform-GA2-*|sort -n -t"-" -k 7,7|tail -1`
cd $BUILDDIR
new_ref=`ls -d cbs-css-platform-GA2-*|sort -n -t"-" -k 7,7|tail -1`
num_ref=`echo $new_ref | awk -F"-" '{print $7}'`
echo "Ancienne reference : $old_ref"
echo "Nouvelle reference : $new_ref"
if [ "${old_ref}" = "${new_ref}" ]
then echo "Pas de nouvelle reference sur jerusalem"
     exit
fi
echo "Copie de la nouvelle reference sur jerusalem"
cd $REFDIR
cp -r ../build/CBS33.0.0PLA/$new_ref .
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
clnum=`$P4 change -i < /home/nsuser/shell/p4specif_300ref.in|awk '{print $2}'`
grep -v PlatformSupportedBuild= reference.properties > reference.properties.tmp
echo "PlatformSupportedBuild=$num_ref" >> reference.properties.tmp
mv reference.properties.tmp reference.properties
$P4 submit -c $clnum

#
# Envoi du mail
#
echo;echo;echo "#######################"
echo "Envoi du mail"
echo
subject="Nouvelle reference GA2PLATFORM : $num_ref"
sed -e "s/!NUM_REF!/$num_ref/" \
< /home/nsuser/shell/300ref.in > /home/nsuser/shell/300ref.txt
email -s "${subject}" $RECIP < /home/nsuser/shell/300ref.txt

############################

exit

echo "Copie de la nouvelle reference sur proxytc01-xp.csg.csgsystems.com"
cd $REFDIR
zip -b . -qr /home/nsuser/tmpftp/$new_ref $new_ref/*
cd /home/nsuser/tmpftp

ftp -i <<!END!
open proxytc01-xp.csg.csgsystems.com
bin
cd 300_platform_reference
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
subject="New 3.0.0 PLATFORM reference : $num_ref"
sed -e "s/!NUM_REF!/$num_ref/" \
< /home/nsuser/shell/300ref2.in > /home/nsuser/shell/300ref2.txt
email -s "${subject}" $RECIP2 < /home/nsuser/shell/300ref2.txt
############################
