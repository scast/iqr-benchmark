WORK_DIR=`pwd`
build() {
    cd $IQR_DIR
    git checkout nljoin
    cmake .
    make clean
    make
    cd $WORK_DIR
}

run() {
    STARTTIME=$(start_clock)
    timeout 600 $IQR_DIR/bin/iqr_asp --views $1 -q $2 --k 7 > runCount
    ENDTIME=$(start_clock)
    RESULTS=$(wc -l runCount)
    ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
    VIEW=`basename $1`
    QUERY=`basename $2`
    rm runCount
    printf "iqr-nljoin,%s,%s,%s,%s" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
}
