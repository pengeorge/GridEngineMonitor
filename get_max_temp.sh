#!/bin/bash

~/mybin/list-all-temp.sh | grep serverx | sed 's: \+:\t:g' |\
    cut -f 3 | grep -Po '(?<=\+)[\d\.]+' | sort -r | head -n 1
