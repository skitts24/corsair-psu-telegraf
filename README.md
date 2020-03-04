# corsair-psu-telegraf

Simple script that parses corsairlink's output and generate a influxdb line (or csv) that could be used with telegraf.

Useful for those that wants to monitor a corsair power supply.

Not tested yet, should theorically work, with a HX1000i. The script is simple, hack it.

corsairmi plugin for unraid
Run manually: /usr/local/bin/corsairmi

name:           'RM750i'
vendor:         'CORSAIR'
product:        'RM750i'
powered:        21206789 (245d. 10h)
uptime:         3102389 (35d. 21h)
temp1:           51.0
temp2:           43.0
fan rpm:          0.0
supply volts:   230.0
total watts:    178.0
output0 volts:   12.1
output0 amps:    11.0
output0 watts:  130.0
output1 volts:    5.0
output1 amps:     8.5
output1 watts:   42.5
output2 volts:    3.3
output2 amps:     1.2
output2 watts:    4.0

I am still working on this and its only partially complete/working. Telegraf is sending the file to Influxdb but its only getting showing the measurement/tag but I havent got the fields to populate. 
