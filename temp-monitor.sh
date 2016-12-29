#!/bin/bash


#while [ 1 ]; do
  str=( "`print-cpu-temp.sh`" )
  for server in serverx{24,27,28,29,32,33,34,35,36,37,38,39,40,41}; do
    str+=( "`ssh $server 2>&1 \"~/print-cpu-temp.sh 2>/dev/null\"`" ) #;\
  done
  #clear
  (
  #echo `date` # +%H:%M:%S
  #echo '=============================================================='
  echo " Server       Max       Avg       Min     |  High     Crit    "
  #echo '=============================================================='
  echo '--------------------------------------------------------------'
  for i in `seq 0 14`; do
    echo "${str[$i]}"
  done
  ) #| sed 's:\([^ ]\) \( \{2,3\}[^ ]\):\1\2:g'
#  sleep 30
#done

#coretemp-isa-0001
#Adapter: ISA adapter
#Core 0:       +49.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 1:       +51.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 2:       +50.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 8:       +44.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 9:       +49.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 10:      +48.0°C  (high = +81.0°C, crit = +101.0°C)
#
#coretemp-isa-0000
#Adapter: ISA adapter
#Core 0:       +38.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 1:       +52.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 2:       +46.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 8:       +43.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 9:       +37.0°C  (high = +81.0°C, crit = +101.0°C)
#Core 10:      +42.0°C  (high = +81.0°C, crit = +101.0°C)

