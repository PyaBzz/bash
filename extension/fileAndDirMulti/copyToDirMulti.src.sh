copyToDirMulti() {
    # synopsis: copyToDirMulti <ArrayOfSourcePaths> <targetDirPath>
    local -n _1srcFiles=$1
    local targetDir=$2

    for file in ${_1srcFiles[@]}; do
        copy $file $targetDir
    done
}
