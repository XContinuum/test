#!/bin/sh
# checks if iphone is connected
 i=0
 for line in $(system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p' | grep "Serial Number:" | awk -F ": " '{print $2}'); do
    UDID=${line}
    echo $UDID
    udid_array[i]=${line}
    i=$(($i+1))
 done

 cnt=${#udid_array[@]}
 for ((i=0;i<cnt;i++)); do
    echo ${udid_array[i]}
 done
