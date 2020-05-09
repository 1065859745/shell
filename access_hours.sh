#!/bin/bash

in_file=$1
time_col=$2

for i in {0..23}
do
    if [ $i -lt 10 ]
    then
        i=0$i
    fi
    echo $i `cat $in_file |awk '{print $col}' col=$time_col |egrep "\t${i}:[0-9]{2}:[0-9]{2}\t" |wc -l`
done