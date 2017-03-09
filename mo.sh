#!/bin/sh

ORGREP=
TMPREP=
MAXFIC=100
while true
do
	cd $ORGREP
	liste=`ls |head -$MAXFIC`
	if [ "${liste}" = "" ]
	then break
	fi
	mv $liste $TMPREP
	cd $TMPREP
	ftp -i <<!END!
	open proxytc01-xp.csg.csgsystems.com
	cd platform_reference
	mput *.xml
	quit
	!END!
done
