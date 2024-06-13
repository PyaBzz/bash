myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"

# echo "appendage running in $myDir"
bashModDir=$myDir/..
source $myDir/defs.sh

#════════════════════════════  Apply  ════════════════════════════

printGreeting
setPromptStyle
export isAppendageRun=true

#════════════════════════════  Aliases  ════════════════════════════

for f in $bashModDir/alias/applied/*.sh; do
    # echo "Sourcing aliases from $f"
    source $f
done

#════════════════════════════  Navigate  ════════════════════════════

export proj=$HOME/proj
cd $proj
