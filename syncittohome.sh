#! /bin/bash

FULL_BW=$1
LOW_BW=$2
SLEEP=$3

HOME=1.2.3.4
USER=MyHomeUser
FROM_FOLDER=/cygdrive/c/HANDBRAKE-OUT/
TO_FOLDER=/DATA/Movie/

while true
h=`date +%H`

  # between 08 and 23  = 200
  # between 23 and 08

	if  [ $h -gt 00 ]  && [ $h -lt 07 ] ; then
  		echo "full BW"
  		bwlimit="$FULL_BW"
	else
  		echo "low BW"
		bwlimit="$LOW_BW"
	fi

	do  rsync -P -avz --bwlimit=$bwlimit --append-verify -e "ssh -p 443" $FROM_FOLDER*.mp4 $USER@$HOME:$TO_FOLDER
	echo "sleeping"
	sleep $SLEEP
	done
