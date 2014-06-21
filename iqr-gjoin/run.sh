
WORK_DIR=`pwd`
build() {
    cd $IQR_GJOIN_DIR
    git checkout master
    cmake .
    make clean
    make
    cd $WORK_DIR
}

run() {
    timeout 600 $IQR_GJOIN_DIR/bin/iqr_asp --views $1 -q $2 -s ~/iqr-gjoin/src/asp/combinator.lp --k 7 > runCount
}
