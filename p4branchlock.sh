#!/bin/sh
team=$1
branch=$2
su - perforce -c "sh /home/perforce/shell/p4branchlock.sh $team $branch"
