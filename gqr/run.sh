build() {
    javac -cp "$GQR_DIR:$GQR_DIR/gqr.jar" SampleCode.java
}

run() {
    timeout 600 java -Xmx56320m -cp "$GQR_DIR:$GQR_DIR/gqr.jar" SampleCode $1 $2 > $3
}
