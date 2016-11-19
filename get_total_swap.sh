#!/bin/bash
qhost | grep serverx | sed 's: \+:\t:g' | cut -f 8 | perl -e '
  $s=0;
  while(<>){
    chomp;
    if ($_ eq "-") {
      $num = 0;
    } elsif (/([\d\.]+)(\w)/) {
      $num = $1;
      if ($2 eq "M") {
        $num /= 1024;
      } elsif ($2 eq "K") {
        $num /= 1024*1024;
      }
    } else {
      die;
    }
    $s+=$num;
  }
  printf "%.1fG",${s};'
