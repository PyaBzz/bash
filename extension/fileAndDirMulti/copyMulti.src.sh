# todo: has got little use
copyMulti() {
    # synopsis: copy <ArrayOfSourcePaths> <ArrayOfTargetPaths>
    local -n sources=$1
    local -n targets=$2

    local sourcesCount=${#sources[@]}
    local targetsCount=${#targets[@]}

    if [[ $sourcesCount != $targetsCount ]]; then
        echo "${FUNCNAME[0]} requires the same number of sources and targets"
        return
    fi

    if (fileMissingMulti sources); then
        echo "${FUNCNAME[0]} some of the source files are missing"
        return
    fi

    for index in "${!sources[@]}"; do
        copy ${sources[$index]} ${targets[$index]}
    done
}
