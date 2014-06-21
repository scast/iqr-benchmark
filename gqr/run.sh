build() {
    echo "Building"
}

run() {
    STARTTIME=$(start_clock)
    timeout 600 java -cp "$GQR_DIR:$GQR_DIR/gqr.jar" SampleCode $1 $2 > runCount
    ENDTIME=$(start_clock)
    RESULTS=$(wc -l runCount)
    ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
    VIEW=`basename $1`
    QUERY=`basename $2`
    rm runCount
    printf "gqr,%s,%s,%s,%s" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
}
