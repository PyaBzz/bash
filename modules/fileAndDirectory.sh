getCallingScriptDir() {
    # Gets the absolute path to the calling script that started this all
    # It's OK to source from here
    dirname "$(readlink -f "$0")"
}

fileExists() {
    # synopsis: fileExists <PathToFile>
    # No quotes around the path!
    if [ -f $1 ]; then true; else false; fi
}

allFilesExist() {
    # synopsis: allFilesExist <arrayOfPaths>
    local -n files=$1
    local res=true
    for file in "${files[@]}"; do
        if (fileMissing $file); then
            res=false
        fi
    done
    $res
}

fileMissing() {
    # synopsis: fileMissing <PathToFile>
    # No quotes around the path!
    if [ ! -f $1 ]; then true; else false; fi
}

anyFileMissing() {
    # synopsis: anyFileMissing <arrayOfPaths>
    local -n files=$1
    local res=false

    for file in ${files[@]}; do
        if (fileMissing $file); then
            res=true
        else
            :
        fi
    done
    $res
}

dirExists() {
    # synopsis: dirExists <PathToDir>
    # No quotes around the path!
    if [ -d $1 ]; then true; else false; fi
}

dirMissing() {
    # synopsis: dirMissing <PathToDir>
    # No quotes around the path!
    if [ ! -d $1 ]; then true; else false; fi
}

addTextInFileAfterMarker() {
    # synopsis: addTextInFileAfterMarker <text> <targetFile> <markerText>
    local text=$1
    local targetFile=$2
    local marker=$3
    sed -i "/$marker/a $text" $targetFile
}

addFileInFileAfterMarker() {
    # synopsis: addFileInFileAfterMarker <sourceFile> <targetFile> <markerText>
    local sourceFile=$1
    local targetFile=$2
    local marker=$3
    sed -i "/$marker/r $sourceFile" $targetFile
}

copyFile() { #Todo: Test although covered in copyFiles
    # synopsis: copyFile <SourceFilePath> to <TargetFilePath>
    local sourceFile=$1
    local secondParameter=$2
    local targetFile=$3

    if (fileMissing $sourceFile); then
        echo "${FUNCNAME[0]} function: Source file not found at $sourceFile"
        return
    fi

    if [[ $secondParameter != "to" ]]; then
        echo "${FUNCNAME[0]} function: The 2nd parameter must be the word 'to'"
        return
    fi

    cp $sourceFile $targetFile

    if [ "$?" -ne "0" ]; then
        echo "Trying operation as root ..."
        sudo cp $sourceFile $targetFile
    fi
}

copyFiles() {
    # synopsis: copyFile <ArrayOfSourcePaths> to <ArrayOfTargetPaths>
    local -n sources=$1
    local secondParameter=$2
    local -n targets=$3

    if [[ $secondParameter != "to" ]]; then
        echo "${FUNCNAME[0]} function: The 2nd parameter must be the word 'to'"
        return
    fi

    local sourcesCount=${#sources[@]}
    local targetsCount=${#targets[@]}

    if [[ $sourcesCount != $targetsCount ]]; then
        echo "${FUNCNAME[0]} requires the same number of sources and targets"
        return
    fi

    if (anyFileMissing sources); then
        echo "${FUNCNAME[0]} some of the source files are missing"
        return
    fi

    for index in "${!sources[@]}"; do
        copyFile ${sources[$index]} to ${targets[$index]}
    done
}

backUp() {
    # synopsis: backUp <PathToTargetFile>
    # Puts a backup of the file next to it
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $targetFile); then
        echo "${FUNCNAME[0]} function: Target file not found at $targetFile"
        return
    fi

    if (fileExists $backupFile); then
        echo "function ${FUNCNAME[0]}: Skipped backup file as it exists at $backupFile"
        return 2 # 2 means that backup already exists
    fi

    copyFile $targetFile to $backupFile

    if (fileExists $backupFile); then
        echo "function ${FUNCNAME[0]}: Backup saved in $backupFile"
    fi
}

isBackedUp() {
    # synopsis: isBackedUp <PathToTargetFile>
    # Checks if target file has been backed up
    local targetFile=$1
    local backupFile=$targetFile.bazbak
    $(fileExists $backupFile)
}

restoreFile() {
    # synopsis: restoreFile <PathToTargetFile>
    # Restores the original file and removes backup
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $backupFile); then
        echo "function ${FUNCNAME[0]}: Backup file not found at $backupFile"
        return
    fi

    mv $backupFile $targetFile

    if [[ $? != 0 ]]; then # Check result of the last command
        echo "Trying operation as root ..."
        sudo mv $backupFile $targetFile
    fi

    if (fileMissing $backupFile); then
        echo "function ${FUNCNAME[0]}: File restored in $targetFile"
    else
        echo "function ${FUNCNAME[0]}: Could not restore $targetFile"
    fi
}
