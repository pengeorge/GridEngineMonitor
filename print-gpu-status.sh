#!/bin/bash

smi_out=`nvidia-smi`
plines="`echo \"$smi_out\" | tail -n 3 | head -n 2 | sed 's/ \+/ /g'`"
for line in "`echo \"$plines\" | head -n 1`" "`echo \"$plines\" | tail -n 1`"; do
  if [[ "$line" =~ '===' ]]; then continue; fi
  gid=`echo $line | cut -f 2 -d' '`
  pid=`echo $line | cut -f 3 -d' '`
  if [ $pid == Not ] || [ $gid == No ]; then
    users[$gid]=''
  else
    users[$gid]=`ps -p $pid -u | sed -n '2p' | cut -f 1 -d' '`
  fi
done
for lines in "`echo \"$smi_out\" | sed -n '8,9p'`" "`echo \"$smi_out\" | sed -n '11,12p'`"; do
  if [[ "$lines" =~ '---' ]]; then continue; fi
  name=`echo "$lines" | sed -n '1p' | grep -Po '(?<=^\|  ).\d.*?(?=\s+(Off)|(on))' | sed 's/GeForce //'`
  status=`echo "$lines" | sed -n '2p' | grep -Po '(?<=^\|)\s*\d+%\s+\d+C' | sed 's/  / /'`
  pwr=`echo "$lines" | sed -n '2p' | grep -Po '(?<=P\d   ).*?(?=\s*\|)' | sed 's/ //g' | sed 's:N/A/N/A::'`
  mem=`echo "$lines" | sed -n '2p' | grep -Po '(?<=^.{35})[^\|]*(?=\|)' | sed 's: \+/ \+: / :'`
  gid=`echo $name | cut -d' ' -f1`
  printf " %-10s%-12s %-8s %9s %-15s%-5s\n" `hostname` "$name" "$status" "$pwr" "$mem" "${users[$gid]}"
  #echo " `hostname` $name	$status $mem" | sed 's: \{5\}: :'
done

echo '---------------------------------------------------------------------'

