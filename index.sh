shopt -s expand_aliases
# This gets the absolute directory where the script is running (vs getCallingScriptDir)
# Don't make it a func as it would always get directory of the func source
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

# ==========================  Globals  ==========================

hostName=$(cat /etc/hostname)

bashModDir="$(getMyDir)" # Cannot use ./ for symlinks
aliasDir=$bashModDir/alias
aliasSrcDir=$bashModDir/alias/source
aliasAppliedDir=$bashModDir/alias/applied

desktopDir=$HOME/Desktop
downloadsDir=$HOME/Downloads
configDir=$HOME/.config
autostartDir=$configDir/autostart

extensionDir=$(getMyDir)/extension
source $extensionDir/index.sh

bashRcFile=$HOME/.bashrc
appendageFile=$(getMyDir)/bashRc/appendage.sh

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
