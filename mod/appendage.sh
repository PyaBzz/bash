bashModDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"

source $bashModDir/appendageDefs.sh

#════════════════════════════  Apply  ════════════════════════════

printGreeting
setPromptStyle
export isAppendageRun=true

#════════════════════════════  Aliases  ════════════════════════════

for f in $bashModDir/alias/applied/*.sh; do source $f; done

#════════════════════════════  Navigate  ════════════════════════════

export proj=$HOME/proj
cd $proj
