#!/bin/sh
MAX=20
cd /home/nsuser/cruisecontrol
for rep in `ls`
do
	if [ -d $rep/logs/cbs-css-apps-$rep-continuous ]
	then cd $rep/logs/cbs-css-apps-$rep-continuous
	     nbc=`ls log*.xml|wc|awk '{print $1}'`
             if [ $nbc -gt $MAX ]
             then nb2del=`expr $nbc - $MAX`
                  rm -rf `ls log*.xml|head -$nb2del`
             fi
	fi
cd /home/nsuser/cruisecontrol
	if [ -d $rep/logs/cbs-css-apps-$rep-daily ]
	then cd $rep/logs/cbs-css-apps-$rep-daily
	     nbd=`ls log*.xml|wc|awk '{print $1}'`
             if [ $nbd -gt $MAX ]
             then nb2del=`expr $nbd - $MAX`
                  rm -rf `ls log*.xml|head -$nb2del`
             fi

	fi
done

