copyToDirWithBackupMulti() {
    # synopsis: copyToDirWithBackupMulti <ArrayOfSourcePaths> <targetDirPath>
    local -n _1srcFiles=$1
    local targetDir=$2

    targetFiles=()
    for file in ${_1srcFiles[@]}; do
        targetFiles+=($targetDir/$(basename "$file"))
    done

    copyWithBackupMulti _1srcFiles targetFiles
}
