shopt -s expand_aliases
# This gets the absolute directory where the script is running
# Don't make it a func as it would always get directory of the func source
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

source $(getMyDir)/imports.sh

testPassed="${colourGreen}Passed${colourNc}"
testFailed="${colourRed}Failed${colourNc}"

printTestTodo() {
    echo -e "${colourPurple}Todo${colourNc}"
}

printTestName() {
    local testName=$1
    echo -e "$colourCyan$f$colourNc"
}
