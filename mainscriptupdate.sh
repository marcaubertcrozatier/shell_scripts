#!/bin/sh
####################
ROOT="/space/nsuser/p4client/c-one/css-apps"
P4CLIENT=coneapps_zan
NBL=9 #nb lignes de commentaires"
####################
ROOTDB="$ROOT/packages/db-tier/migration-scripts"
OLDVERSION=`grep ProductVersion $ROOT/version.properties|awk -F"=" '{print$2}'`

mkdir $ROOTDB/archive/$OLDVERSION
p4 edit $ROOTDB/cid/upgrade_cid.sql
p4 edit $ROOTDB/ocm/upgrade_ocm.sql

####################
echo "-- Name: upgrade_cid.sql" > $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- Description: Update Script" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- Version_name:" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- Version_num: 3.5.90-3.3.1" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- Drop_num:" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- TR_num:" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- Ticket:" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- PREREQ:  3.5.50 Mobistar 12 installed" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
echo "-- Update Script :" >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql
####################
grep -v "\-\-" $ROOTDB/cid/upgrade_cid.sql >> $ROOTDB/archive/$OLDVERSION/upgrade_cid.sql

cd $ROOTDB/cid
nbl=`wc -l upgrade_cid.sql | awk '{print $1}'`
nbl=`expr $nbl - $NBL`
tail -$nbl upgrade_cid.sql > upgrade_cid.tmp
mv upgrade_cid.tmp upgrade_cid.sql



####################
echo "-- Name: upgrade_ocm.sql" > $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- Description: Update Script" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- Version_name:" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- Version_num: 3.5.90-3.3.1" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- Drop_num:" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- TR_num:" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- Ticket:" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- PREREQ:  3.5.50 Mobistar 12 installed" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
echo "-- Update Script :" >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql
####################
grep -v "\-\-" $ROOTDB/ocm/upgrade_ocm.sql >> $ROOTDB/archive/$OLDVERSION/upgrade_ocm.sql

cd $ROOTDB/ocm
nbl=`wc -l upgrade_ocm.sql | awk '{print $1}'`
nbl=`expr $nbl - $NBL`
tail -$nbl upgrade_ocm.sql > upgrade_ocm.tmp
mv upgrade_ocm.tmp upgrade_ocm.sql
