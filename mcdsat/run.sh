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
    timeout 600 $MCDSAT_DIR/mcdsat/mcdsat RW $1 $2 > $3
}
