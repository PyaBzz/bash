source ../bashExtension/imports.sh

appendToBashrc() {
    cat <<EOT >>$bashrcFile

#══════════════════  BazMod  ══════════════════
source $appendageFile

EOT
}

applyBashMod() {
    if (isBashModded); then
        # You've already been modded. Just update
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
        else
            echo "Aborted"
            return
        fi
    else
        backUp $bashrcFile
        appendToBashrc

        if (dirMissing $aliasesDir); then
            mkdir -p $aliasesDir
        fi
    fi

    copyFile $appendageSource to $appendageFile
    copyFile $aliasSource to $aliasesDir/mod.sh
    echo "Applied!"
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
    if (askUserClear "Mod bashrc?"); then
        applyBashMod
    else
        echo "Aborted"
    fi
fi
