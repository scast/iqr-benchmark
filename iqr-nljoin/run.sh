WORK_DIR=`pwd`
build() {
    cd $IQR_NLJOIN_DIR
    git checkout nljoin
    cmake .
    make clean
    make
    cd $WORK_DIR
}

run() {
    timeout 600 $IQR_NLJOIN_DIR/bin/iqr_asp --views $1 -q $2 -s $IQR_NLJOIN_DIR/src/asp/combinator.lp --k 7 > $3
}
