#!/bin/bash

print-cpu-temp.sh
for server in serverx{27,28,29,32,33,34,35}; do
  ssh $server 2>&1 \"print-cpu-temp.sh\"
done

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

