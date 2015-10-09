#!/bin/bash
qhost | grep serverx | sed 's: \+:\t:g' | cut -f 4 | perl -e '$s=0;while(<>){chomp;$s+=$_;}print $s'
