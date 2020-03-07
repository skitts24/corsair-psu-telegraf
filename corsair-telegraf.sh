#!/usr/bin/env bash
#set -x
RAW=$(/usr/local/bin/corsairmi)
OUTPUT=/mnt/user/appdata/telegraf/corsair-telegraf.csv

function simple() {
#       echo $(echo "$RAW" | grep "$1" | cut -d ':' -f2 | cut -d ' ' -f 2)
        echo "$RAW" | grep "$1" |  tr -s ' ' | cut -d ':' -f 2 | cut -d ' ' -f 2
}
function rail() {
#       echo "$RAW" | grep -A 3 "output ${1}v" | grep "$2" | tr -s ' ' | cut -d ' ' -f 2
        echo "$RAW" | grep "$1" | grep "$2" | tr -s ' ' |  cut -d ' ' -f 3
}

# Details
name=$(simple "name")
vendor=$(simple "vendor")

#PSU Status
temp_0=$(simple "temp1")
temp_1=$(simple "temp2")
powered=$(simple "powered")
uptime=$(simple "uptime")
supply=$(simple "supply volts")
total_watts=$(simple "total watts")

# 12V Rail
volts_12v=$(rail "output0 volts")
amps_12v=$(rail "output0 amps")
watts_12v=$(rail "output0 watts")

# 5V Rail
volts_5v=$(rail "output1 volts")
amps_5v=$(rail "output1 amps")
watts_5v=$(rail "output1 watts")

# 3.3V Rail
volts_3_3v=$(rail "output2 volts")
amps_3_3v=$(rail "output2 amps")
watts_3_3v=$(rail "output2 watts")

# InfluxDB output to csv format
echo "power_supply,model=$name,vendor=$vendor temp_0=$temp_0,temp_1=$temp_1,total_time=$powered,uptime=$uptime,supply_volts=$supply,total_watts=$total_watts 12v_volts=$volts_12v,12v_amps=$amps_12v,12v_watts=$watts_12v,5v_volts=$volts_5v,5v_amps=$amps_5v,5v_watts=$watts_5v,3.3v_volts=$volts_3_3v,3.3v_amps=$amps_3_3v,3.3v_watts=$watts_3_3v $(date '+%s%N')" > $OUTPUT

# CSV output
#echo "measurement,temp_0,temp_1,total_time,uptime,supply_voltage,total_watts,12v_volts,12v_amps,12v_watts,5v_volts,5v_amps,5v_watts,3.3v_volts,3.3v_amps,3.3v_watts" > $OUTPUT
#echo "power_supply,$temp_0,$temp_1,$powered,$uptime,$supply,$total_watts,$volts_12v,$amps_12v,$watts_12v,$volts_5v,$amps_5v,$watts_5v,$volts_3_3v,$amps_3_3v,$watts_3_3v" >> $OUTPUT
