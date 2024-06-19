copy() { #Todo: Test although covered in copyMulti
    # synopsis: copy <SourceFilePath> <TargetFilePath> [-b|--backup] [-v|--verbose]
    local sourceFile=$1
    local targetFile=$2
    local shouldBackup=false
    local verbose=false

    if [ "$3" = "--backup" ] || [ "$3" = "-b" ]; then shouldBackup=true; fi
    if [ "$4" = "--verbose" ] || [ "$4" = "-v" ]; then verbose=true; fi

    if (fileMissing $sourceFile); then
        echo "Func ${FUNCNAME[0]}: Source file not found at $sourceFile"
        return
    fi

    if ($shouldBackup); then
        backUp $targetFile $4
    fi

    cp $sourceFile $targetFile 1>/dev/null 2>&1

    if (ifThatFailed); then
        sudo cp $sourceFile $targetFile
    fi
}
