#!/bin/bash
#
# Warn when your system gets low on memory
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
		zenity --question --text "Warning Low Memory, only $mem Mb Remaining" --cancel-label="Quit and Stop Checking" --ok-label="Ok and Keep Checking" --title="Low Memory" 
		if [ "$?" == "1" ] #handle quit
		then
			exit
		fi
	fi
	sleep 60
done
