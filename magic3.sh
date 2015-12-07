#!/bin/bash

SAMPLES=4
BEGIN=44
END=45


for i in `seq $BEGIN $END`
do
    echo -n $i bits
    for j in `seq 1 $SAMPLES`
    do
        echo -n .
        ./keyGen $i | /usr/bin/time -f '%U' ./keyBreaker  > /dev/null 2>> time_$i
        #./keyGen $i | /usr/bin/time -f '%U' ./keyBreaker  > /dev/null $| tee time_$i
    done
    echo ""
done
