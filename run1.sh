#!/bin/bash

start_clock() {
    python -c 'import time; print time.time()'
}

. conf.sh
. $1/run.sh

# build

STARTTIME=$(start_clock)
TMPFILE=`mktemp` || exit 1
run $2 $3 $TMPFILE
ENDTIME=$(start_clock)
RESULTS=$(wc -l $TMPFILE)
ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
VIEW=`basename $2`
QUERY=`basename $3`
rm $TMPFILE
printf "%s,%s,%s,%s,%s\n" "$1" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
