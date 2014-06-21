#!/bin/bash

start_clock() {
    python -c 'import time; print time.time()'
}

. conf.sh
. $1/run.sh

build

for view in `ls $1/views`; do
    for query in `ls $1/queries`; do
        run $view $query
    done;
done;
