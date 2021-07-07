source ../source.sh

appendToBashrc() {
    cat <<EOT >>$bashrcFile

#══════════════════  BazMod  ══════════════════
source $appendageFile

EOT
}

applyBashMod() {
    if (askUserClear "Mod bashrc?"); then
        :
    else
        echo "Skipped"
        return
    fi

    if (isBashModded); then
        # You've already been modded. Just update
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
        else
            echo "Skipped"
            return
        fi
    else
        backUp $bashrcFile
        appendToBashrc

        if (dirMissing $aliasDir); then
            mkdir -p $aliasDir
        fi
    fi

    copyFile $appendageSource to $appendageFile
    echo "Applied"
}

applyAliases() {
    package="aliases"
    if (askUser "Apply $package?"); then
        if (isBashModded); then
            copyFile $aliasSource to $aliasDir/mod.sh
            echo "$package applied"
        else
            echo "Skipped $package as bashMod hasn't been applied yet"
        fi
    else
        echo "Skipped $package"
    fi
}

appendageSource=./appendage.sh
appendageFile=$bashModDir/appendage.sh
aliasSource=./alias

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo mod?"); then
        restoreFile $bashrcFile
    else
        echo "Aborted"
    fi
else
    applyBashMod
    applyAliases
fi
