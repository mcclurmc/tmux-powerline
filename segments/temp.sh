#!/bin/bash

run_segment() {
    echo -n "∆ "

    local total=0

    #total=$(expr ${total} + $(cat /sys/devices/platform/coretemp.0/temp1_input))
    total=$(expr ${total} + $(cat /sys/devices/platform/coretemp.0/temp2_input))
    #total=$(expr ${total} + $(cat /sys/devices/platform/coretemp.0/temp3_input))
    #total=$(expr ${total} + $(cat /sys/devices/virtual/hwmon/hwmon0/temp1_input))

    #local avg=$(expr ${total} / 4)
    local avg=$(expr ${total} / 1)

    local temp=$(echo "scale=1; ${avg} / 1000" | bc)

    echo "${temp}°C"
    return 0
}
