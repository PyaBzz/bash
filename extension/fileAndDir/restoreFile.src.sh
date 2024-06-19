restoreFile() {
    # synopsis: restoreFile <PathToTargetFile>
    # Restores the original file and removes backup
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $backupFile); then
        echo "Func ${FUNCNAME[0]}: Backup file not found at $backupFile"
        return
    fi

    echo "Func ${FUNCNAME[0]}: Restoring $backupFile"
    mv $backupFile $targetFile

    if (ifThatFailed); then # Check result of the last command
        sudo mv $backupFile $targetFile
    fi

    if (fileMissing $backupFile); then
        echo "Func ${FUNCNAME[0]}: File restored in $targetFile"
    else
        echo "Func ${FUNCNAME[0]}: Could not restore $targetFile"
    fi
}
