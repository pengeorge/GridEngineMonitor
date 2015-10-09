#!/bin/bash

temps=`sensors | perl -e '
  $max = -1;
  $min = 999;
  $sum = 0;
  $count = 0;
  while(<>) {
    chomp;
    if (/Core/) {
      if (/([\+\-].*)°C  \(high = (.*), crit = (.*)\)/) {
        $temp = $1;
        if ($temp > $max) {
          $max = $temp;
        }
        if ($temp < $min) {
          $min = $temp;
        }
        $sum += $temp;
        $count++;
        $high = $2;
        $crit = $3;
      }
    }
  }
  $avg = $sum / $count;
  printf("%+8.1f°C%+8.1f°C%+8.1f°C  |%9s%11s\n", $max, $avg, $min, $high, $crit);'`


echo " `hostname`$temps"
#echo '--------------------------------------------------------------'

