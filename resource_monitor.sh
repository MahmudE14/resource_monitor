#!/bin/bash
for i in {1..3000}
do   
    sleep 1;
    clear; 
    temp=$(cat /sys/class/thermal/thermal_zone*/temp | tail -1);
    temp=$(expr $temp / 1000);

    memory_used=$(free | awk '{print $3}' | head -2 | tail -1)
    memory_free=$(free | awk '{print $4}' | head -2 | tail -1)
    memory_available=$(free | awk '{print $7}' | head -2 | tail -1)
    memory_total=$(free | awk '{print $2}' | head -2 | tail -1)


    echo "CPU Temperature: ${temp}°C";
    echo "Memory Used: ${memory_used}/${memory_total}";
    echo "Memory Available: ${memory_available}"
done
