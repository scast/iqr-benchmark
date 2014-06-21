WORK_DIR=`pwd`

build() {
    cd $MCDSAT_DIR
    cd TPG-3.1.0
    python setup.py install
    cd ..
    cd dnnf-models
    make clean
    make
    cd $WORK_DIR
}

run() {
    STARTTIME=$(start_clock)
    timeout 600 $MCDSAT_DIR/mcdsat/mcdsat RW $1 $2 > runCount
    ENDTIME=$(start_clock)
    RESULTS=$(wc -l runCount)
    ELAPSED=$(echo $ENDTIME-$STARTTIME | bc)
    VIEW=`basename $1`
    QUERY=`basename $2`
    rm runCount
    printf "mcdsat,%s,%s,%s,%s" "$VIEW" "$QUERY" "$ELAPSED" "$RESULTS"
}
