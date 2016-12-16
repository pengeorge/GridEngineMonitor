#!/bin/bash

smi_out=`nvidia-smi`
for lines in "`echo \"$smi_out\" | sed -n '8,9p'`" "`echo \"$smi_out\" | sed -n '11,12p'`"; do
  if [[ "$lines" =~ '---' ]]; then continue; fi
  name=`echo "$lines" | sed -n '1p' | grep -Po '(?<=^\|  ).\d.*?(?=\s+(Off)|(on))' | sed 's/GeForce //'`
  status=`echo "$lines" | sed -n '2p' | grep -Po '(?<=^\|)\s*\d+%\s+\d+C' | sed 's/  / /'`
  pwr=`echo "$lines" | sed -n '2p' | grep -Po '(?<=P\d   ).*?(?=\s*\|)' | sed 's/ //g' | sed 's:N/A/N/A::'`
  mem=`echo "$lines" | sed -n '2p' | grep -Po '(?<=^.{35})[^\|]*(?=\|)' | sed 's: \+/ \+: / :'`
  printf " %-10s%-12s %-8s %9s %-15s\n" `hostname` "$name" "$status" "$pwr" "$mem"
  #echo " `hostname` $name	$status $mem" | sed 's: \{5\}: :'
done
echo '---------------------------------------------------------------'

