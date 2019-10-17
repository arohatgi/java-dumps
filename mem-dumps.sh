#!/bin/sh
# Generate N heap dumps of the process PID with an INTERVAL between each dump request.

if [ $# -ne 3 ]; then
   echo Generates Java heap dumps using the jmap command.
   echo
   echo usage: $0 process_id repetitions interval
   exit 1
fi

PID=$1
N=$2
INTERVAL=$3

for ((i=1;i<=$N;i++))
do
   d=$(date +%Y%m%d-%H%M%S)
   dump="threaddump-$PID-$d.txt"
   echo $i of $N: $dump
   jmap -dump:file=/tmp/java-`date +%s`.hprof $PID
   sleep $INTERVAL
done
