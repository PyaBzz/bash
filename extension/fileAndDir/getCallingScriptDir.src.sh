getCallingScriptDir() {
    # Gets the absolute path to the calling script that started this all (vs getMyDir)
    # It's OK to source from here
    dirname "$(readlink -f "$0")"
}
