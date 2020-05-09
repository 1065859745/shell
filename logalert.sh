#!/bin/bash

# configre sleep
# Read log interval
read_sleep=10
# Alert messages interval
alert_sleep=300
app_name=$1
log_path=$2

dir=$(cd $(dirname ${BASH_SOURCE});pwd)
for (( ; ; ))
do
    init_size=`wc -c $log_path |awk '{print $1}'`
    for (( ; ; ))
    do
        size=`wc -c $log_path |awk '{print $1}'`

        # If log has change, read messages in change
        if [ $size -gt $init_size ]
        then
            read_bytes=`expr $size - $init_size`
            log_error=`tail -c ${read_bytes} $log_path |egrep "$3"|sort|uniq`

            # Include error or not
            if [ -n "$log_error" ]
            then
                ##########    
                # 满足条件时执行的代码
                ##########
                break
            fi
        fi
        init_size=$size
        sleep $read_sleep
    done
    sleep $alert_sleep
done