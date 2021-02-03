shopt -s expand_aliases
# This gets the absolute directory where the script is running
# Don't make it a func as it would always get directory of the func source
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

sourceFromDir() {
    # synopsis: sourceFromDir <PathToDir>
    # Sources all .sh files in the given directory
    for f in $1/*.sh; do source $f; done
}

modulesDir=$(getMyDir)/modules
sourceFromDir $modulesDir
