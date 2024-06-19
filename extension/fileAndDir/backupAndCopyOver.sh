copyWithBackup() { #Todo: Test
    # synopsis: copyWithBackup <SourceFilePath> <TargetFilePath>
    local sourceFile=$1
    local targetFile=$2

    if (fileMissing $sourceFile); then
        echo "Func ${FUNCNAME[0]}: Source file not found at $sourceFile"
        return
    fi

    backUp $targetFile

    if (backUpSkipped); then
        if (askUser "Target file at $targetFile has already been modded. Replace it?"); then
            echo "Replacing $targetFile"
        else
            echo "Aborted"
            return
        fi
    fi

    copy $sourceFile $targetFile
    echo "$targetFile copied/replaced!"
}
