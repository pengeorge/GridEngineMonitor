#!/bin/bash

lines=`nvidia-smi | sed -n '8,9p'`
name=`echo "$lines" | sed -n '1p' | grep -Po '(?<=^\|  ).\d.*(?=\s+Off)'`
status=`echo "$lines" | sed -n '2p' | grep -Po '(?<=^\|).\d+%\s+\d+C'`
mem=`echo "$lines" | sed -n '2p' | grep -Po '(?<=^.{35})[^\|]*(?=\|)'`
echo " `hostname` $name $status $mem" | sed 's: \{5\}: :'
#echo '--------------------------------------------------------------'

