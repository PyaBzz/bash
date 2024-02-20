source ../source.sh

bashRcFile=$HOME/.bashrc
appendageFile=$(getMyDir)/appendage.sh

appendToBashrc() {
    cat <<EOT >>$bashRcFile

#══════════════════  BazMod  ══════════════════
source $appendageFile

EOT
}

applyBashMod() {
    if (isBashModded); then
        echo "Skipped as your Bash is already modded"
        return
    fi

    backUp $bashRcFile
    appendToBashrc
    isAppendageRun=true
}

linkAlias() {
    local pkg=$1
    local aliasLnk=$aliasAppliedDir/$pkg.sh

    askToProceed "Install aliases for $pkg?"

    if (isBashNotModded); then
        echo "Skipped aliases. Prerequisite: bashMod"
        return
    fi

    cd $aliasAppliedDir
    ln -sf ../source/$pkg.sh
    cd -

    if (fileExists $aliasLnk); then
        echo "Done!"
    else
        echo "Failed!"
    fi
}

unlinkAlias() {
    local pkg=$1
    local aliasLnk=$aliasAppliedDir/$pkg.sh
    askToProceed "Uninstall aliases for $pkg?"
    unlink $aliasLnk

    if (fileMissing $aliasLnk); then
        echo "Done!"
    else
        echo "Failed!"
    fi
}
