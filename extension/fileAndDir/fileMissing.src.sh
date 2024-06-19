fileMissing() {
    # synopsis: fileMissing <PathToFile>
    # No quotes around the path!
    if [ ! -f $1 ]; then true; else false; fi
}
