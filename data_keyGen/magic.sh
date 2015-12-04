#!/bin/bash

##################################
#  First run with small numbers  #
##################################

RERUNS=200
SAMPLES=4
BEGIN=4096
END=8192
STEP=128

for k in `seq 1 $RERUNS`
do
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
done

###################################
##   Rerun with bigger numbers    #
###################################
#
#SAMPLES=10
#BEGIN=4096
#END=8192
#STEP=512
#
#for i in `seq $BEGIN $STEP $END`
#do
#    echo -n $i bits
#    for j in `seq 1 $SAMPLES`
#    do
#        echo -n .
#        /usr/bin/time -f '%U' ./keyGen $i > /dev/null 2>> time_$i
#        #./keyGen $i | /usr/bin/time -f '%U' ./keyBreaker  > /dev/null $| tee time_$i
#    done
#    echo ""
#done
