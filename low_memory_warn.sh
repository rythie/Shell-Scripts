#!/bin/sh
#
# Warn when your system gets low in memory
#
# Use Ok, to accept warning a get further ones
# Use Quit, to stop getting messages
#

#Config
min_memory=500 #In MB

#Code
mem=`free -m |grep + |tr -s " " |cut -f4 -d' '`
while [ true ]
do
	if [ $mem -lt $min_memory ]
	then
		xmessage "Low Memory: " $mem "Mb" -buttons ok:1,quit:99
		if [ $? == 99 ] #handle quit
		then
			exit
		fi
	fi
	sleep 60
done
