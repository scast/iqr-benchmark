build() {
    echo "Building"
}

run() {
    timeout 600 java -cp "$GQR_DIR:$GQR_DIR/gqr.jar" SampleCode $1 $2 > runCount
}
