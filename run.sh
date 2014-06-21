#!/bin/bash

start_clock() {
    python -c 'import time; print time.time()'
}

. conf.sh
. $1/run.sh

# build

for view in `ls $1/views | sort -V`; do
    for query in `ls $1/queries | sort -V`; do
        STARTTIME=$(start_clock)
	TMPFILE=`mktemp` || exit 1
        run $view $query $TMPFILE
        ENDTIME=$(start_clock)
        RESULTS=$(wc -l $TMPFILE)
        ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
        VIEW=`basename $view`
        QUERY=`basename $query`
        rm $TMPFILE
        printf "%s,%s,%s,%s,%s\n" "$1" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
    done;
done;
