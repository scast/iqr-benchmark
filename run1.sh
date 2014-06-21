#!/bin/bash

start_clock() {
    python -c 'import time; print time.time()'
}

. conf.sh
. $1/run.sh

# build

STARTTIME=$(start_clock)
run $2 $3
ENDTIME=$(start_clock)
RESULTS=$(wc -l runCount)
ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
VIEW=`basename $2`
QUERY=`basename $3`
rm runCount
printf "%s,%s,%s,%s,%s\n" "$1" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
