mem=`free -m |grep + |tr -s " " |cut -f4 -d' '`
while [ true ]
do
	if [ $mem -lt 500 ]
	then
		xmessage "Low Memory: " $mem "Mb" -buttons ok:1,quit:99
		if [ $? == 99 ] #handle quit
		then
			exit
		fi
	fi
	sleep 60
done
