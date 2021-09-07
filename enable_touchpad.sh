#!/bin/bash

xoutput_list=$(xinput list | grep Touchpad)
if [ -z "$xoutput_list" ]
    then echo "Touchpad not found"
    exit $?
fi
# xoutput_id=$(echo $xoutput_list| cut -d'=' -f 2)
device_id=${xoutput_list:50:2}
xoutput_props=$(xinput list-props $device_id | grep "libinput Tapping Enabled")
for sign in $xoutput_props
    do
        if [ ${sign:0:1} == '(' ]
            then
            prop_id=${sign:1:(${#sign}-3)}
            break
        fi
    done
xinput set-prop $device_id $prop_id 1
