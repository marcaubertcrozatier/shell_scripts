#!/bin/sh
#
#
for pid in `ps -edf|grep nsuser|grep xterm|grep tail|grep build_log_CCBS|awk '{print $2}'`
do
	kill -9 $pid
done
