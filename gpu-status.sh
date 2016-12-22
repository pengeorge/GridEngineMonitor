#!/bin/bash


while [ 1 ]; do
  str=( "`print-gpu-status.sh`" )
  for server in serverx{27,28,29,32,33,34,35,36,37,38,39,40,41}; do
    str+=( "`ssh $server 2>&1 \"~/print-gpu-status.sh\"`" ) #;\
  done
  clear
  #echo `date` # +%H:%M:%S`
  #echo '================================================================='
  echo " Server    GPU Name      Fan  Temp   Pwr       Memory-Usage  "
  echo '==============================================================='
  #echo '----------------------------------------------------------------'
  for i in `seq 0 13`; do
    echo "${str[$i]}"
  done
  sleep 45
done

# Tue Mar 11 01:04:34 2014       
# +------------------------------------------------------+                       
# | NVIDIA-SMI 5.319.37   Driver Version: 319.37         |                       
# |-------------------------------+----------------------+----------------------+
# | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
# | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
# |===============================+======================+======================|
# |   0  GeForce GTX 670     Off  | 0000:03:00.0     N/A |                  N/A |
# | 33%   50C  N/A     N/A /  N/A |        7MB /  2047MB |     N/A      Default |
# +-------------------------------+----------------------+----------------------+
#                                                                                
# +-----------------------------------------------------------------------------+
# | Compute processes:                                               GPU Memory |
# |  GPU       PID  Process name                                     Usage      |
# |=============================================================================|
# |    0            Not Supported                                               |
# +-----------------------------------------------------------------------------+
