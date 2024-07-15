shopt -s expand_aliases
# This gets the absolute directory where the script is running (vs getCallingScriptDir)
# Don't make it a func as it would always get directory of the func source
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

# ==========================  Globals  ==========================

hostName=$(cat /etc/hostname)

bashModDir="$(getMyDir)" # Cannot use ./ for symlinks
aliasDir=$bashModDir/alias
aliasSrcDir=$aliasDir/source
aliasAppliedCsv=$aliasDir/applied.sh

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
    local aliasSrc=$aliasSrcDir/$pkg.sh

    if (isBashNotModded); then
        echo "Skipped aliases. Prerequisite: bashMod"
        return 1
    fi

    if (fileMissing $aliasSrc); then
        echo "Alias source not found at $aliasSrc"
        return 1
    fi

    askToProceed "Install aliases for $pkg?"

    echo -n ",$pkg" >> $aliasAppliedCsv # -n prevents newLine
}

unlinkAlias() {
    local pkg=$1
    local aliasSrc=$aliasSrcDir/$pkg.sh

    if (isBashNotModded); then
        echo "Skipped aliases. Prerequisite: bashMod"
        return 1
    fi

    if (fileMissing $aliasSrc); then
        echo "Alias source not found at $aliasSrc"
        return 1
    fi

    askToProceed "Uninstall aliases for $pkg?"

    wordToDelete=",$pkg"
    sed -i "s/$wordToDelete//g" $aliasAppliedCsv
}
