shopt -s expand_aliases
# This gets the absolute directory where the script is running (vs getCallingScriptDir)
# Don't make it a func as it would always get directory of the func source
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

# ==========================  Extension  ==========================

isBashModded() {
    if [ -z ${isAppendageRun+x} ]; then false; else true; fi
}

isBashNotModded() {
    if (isBashModded); then false; else true; fi
}

ifThatWorked() {
    if [ "$?" -eq "0" ]; then
        true
    else
        false
    fi
}

ifThatFailed() {
    if [ "$?" -ne "0" ]; then
        true
    else
        false
    fi
}

sourceFromDir() {
    # synopsis: sourceFromDir <PathToDir> <Extension>
    # Sources all files with the given extension in the given directory recursively
    # Default extension is .sh

    local extension=".sh"
    if [ ! -z "$2" ]; then
        extension="$2"
    fi
    for f in $(find $1 -name "*$extension"); do source $f; done
}

myDir=$(getMyDir)
sourceFromDir $myDir .src.sh
