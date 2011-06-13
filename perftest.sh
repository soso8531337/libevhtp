#!/bin/bash

if [ "$#" -ne 5 ]
then
	echo "usage <host> <port> <uri> <connections> <calls>"
	exit 1
fi

host=$1
port=$2
uri=$3
conns=$4
calls=$5

echo "Running ($conns connections | $calls requests each)"
httperf --server=$host --port=$port --uri=$uri --rate=1e+06 --send-buffer=4096 --recv-buffer=16384 --wsess=$conns,$calls,0 

