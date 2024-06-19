backUp() {
    # synopsis: backUp <PathTotargetObj> [-v|--verbose]
    # Puts a backup of the file next to it
    local targetObj=$1
    local backupObj=$targetObj.bazbak
    local verbose=false

    if [ "$2" = "--verbose" ] || [ "$2" = "-v" ]; then verbose=true; fi

    if (fileMissing $targetObj && dirMissing $targetObj); then
        if ($verbose); then
            echo "Func ${FUNCNAME[0]}: Target not found at $targetObj"
        fi
        return 1
    fi

    if (fileExists $backupObj || dirExists $backupObj); then
        if ($verbose); then
            echo "Func ${FUNCNAME[0]}: Skipped as it exists at $backupObj"
        fi
        return 2 # 2 means that backup already exists
    fi

    cp -r $targetObj $backupObj

    if (ifThatFailed); then
        sudo cp -r $targetObj $backupObj
    fi

    if (fileExists $backupObj || dirExists $backupObj); then
        if ($verbose); then
            echo "Func ${FUNCNAME[0]}: Backup saved in $backupObj"
        fi
    fi
}
