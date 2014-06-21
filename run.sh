#!/bin/bash

start_clock() {
    python -c 'import time; print time.time()'
}

. conf.sh
. $1/run.sh

build

for view in `ls $1/views`; do
    for query in `ls $1/queries`; do
        STARTTIME=$(start_clock)
        timeout 600 run $view $query
        ENDTIME=$(start_clock)
        RESULTS=$(wc -l runCount)
        ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
        VIEW=`basename $view`
        QUERY=`basename $query`
        rm runCount
        printf "%s,%s,%s,%s,%s" "$1" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
    done;
done;
