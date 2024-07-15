#════════════════════════════  Defs  ════════════════════════════

myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"

# echo "appendage running in $myDir"
bashModDir=$myDir/..
source $myDir/funcs.sh

aliasDir=$bashModDir/alias
aliasSrcDir=$aliasDir/source
aliasAppliedCsv=$aliasDir/applied.sh

#════════════════════════════  Apply  ════════════════════════════

printGreeting
setPromptStyle
export isAppendageRun=true

#════════════════════════════  Aliases  ════════════════════════════

source $aliasSrcDir/base.sh

readCsvFile $aliasAppliedCsv
for filename in "${values[@]}"; do
    echo "Sourcing aliases for $filename"
    fullname=$filename.sh
    source $aliasSrcDir/$fullname
done

#════════════════════════════  Navigate  ════════════════════════════

export proj=$HOME/proj
cd $proj
