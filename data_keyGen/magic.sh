#!/bin/bash

SAMPLES=10
BEGIN=128
END=4096
STEP=128

make

for i in `seq $BEGIN $STEP $END`
do
    echo -n $i bits
    for j in `seq 1 $SAMPLES`
    do
        echo -n .
        /usr/bin/time -f '%U' ./keyGen $i > /dev/null 2>> time_$i
        #./keyGen $i | /usr/bin/time -f '%U' ./keyBreaker  > /dev/null $| tee time_$i
    done
    echo ""
done
