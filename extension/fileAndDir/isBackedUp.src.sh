isBackedUp() {
    # synopsis: isBackedUp <PathToTargetFile>
    # Checks if target file has been backed up
    local targetFile=$1
    local backupFile=$targetFile.bazbak
    $(fileExists $backupFile)
}
