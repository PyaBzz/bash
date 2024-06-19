backUpSkipped() {
    if [ "$?" -eq "2" ]; then
        true
    else
        false
    fi
}
