WORK_DIR=`pwd`
build() {
    cd $IQR_DIR
    git checkout master
    cmake .
    make clean
    make
    cd $WORK_DIR
}

run() {
    $IQR_DIR/bin/iqr_asp --views $1 -q $2 --k 7 > runCount
}
