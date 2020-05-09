#!/bin/bash

in_file=$1
time_col=$2

for i in {0..23}
do
    if [ $i -lt 10 ]
    then
        i=0$i
    fi
    for j in {0..59}
    do
        if [ $j -lt 10 ]
        then
            j=0$j
        fi
        echo ${i}:${j} `cat $in_file |awk '{print $col}' col=$time_col |egrep ":${i}:${j}:" |wc -l`
    done
done