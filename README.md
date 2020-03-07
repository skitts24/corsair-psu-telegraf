# corsair-psu-telegraf

Simple script that parses corsairlink's output and generate a influxdb line (or csv) that could be used with telegraf.

Useful for those that wants to monitor a corsair power supply.

Not tested yet, should theorically work, with a HX1000i. The script is simple, hack it.

corsairmi plugin for unraid: https://forums.unraid.net/topic/86646-plugin-unraid-json-api/

Run manually from unraid server after plugin is installed: 

```console
/usr/local/bin/corsairmi
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
output2 watts:    4.0`
```

Sample output:
```
power_supply,model=RM750i,vendor=CORSAIR temp_0=50.8,temp_1=42.8,total_time=21483318,uptime=3378918,supply_volts=230.0,total_watts=158.0 12v_volts=12.1,12v_amps=9.5,12v_watts=114.0,5v_volts=5.0,5v_amps=8.1,5v_watts=40.0,3.3v_volts=3.3,3.3v_amps=1.3,3.3v_watts=4.0 1583601060427175139
```

I am still working on this and its only partially complete/working. Telegraf is sending the file to Influxdb but its only getting showing the measurement/tag but I havent got the fields to populate. 
