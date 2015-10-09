#!/bin/bash


tabs 5
while [ 1 ]; do
  r_and_qw=`qstat -u '*' | sed '1,2d'`
  full=`echo "$r_and_qw" | grep server`
  qw=`echo "$r_and_qw" | grep -v server`
  total_slots=`echo "$full" | awk 'BEGIN{s=0}{s+=$9}END{print s}'`
  waiting_jobs=`echo "$qw" | grep . | wc -l`
  out=
  for id in {"22 24 25 27","28 29 32 33","34 35 -- --"}; do
    out=${out}$'\n'
    for i in $id; do
      lines="`echo "$full" | grep serverx${i}`"
      slots=`echo "$lines" | awk 'BEGIN{s=0}{s+=$9}END{print s}'`
      out="${out}serverx$i	$slots	`echo "$lines" | grep s | wc -l`	| "
    done
  done
  clear
  #echo `date` # +%H:%M:%S
  echo '==================================================================================================='
  echo "Server   	#S	#T	| Server   	#S	#T	| Server   	#S	#T	| Server   	#S	#T	|"
  echo "===================================================================================================$out"
  echo '---------------------------------------------------------------------------------------------------'
  echo "Slots in use: $total_slots 	Jobs waiting: $waiting_jobs"
  echo '---------------------------------------------------------------------------------------------------'
  sleep 15
done

