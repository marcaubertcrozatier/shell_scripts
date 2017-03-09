#!/bin/sh
#
#
# 
#
#
CFG2HTMLHOME=/usr/local/cfg2html-linux-1.45
FTPHOME=/home/jerusalem2/sf/cdimages/swf/confbuildmachines
export CFG2HTMLHOME FTPHOME

cd $CFG2HTMLHOME
./cfg2html
cp fr-par-fantasio.comverse.com.html $FTPHOME
