# todo: unused func!
fileMissingMulti() {
    # synopsis: fileMissingMulti <arrayOfPaths>
    local -n files=$1
    local res=false

    for file in ${files[@]}; do
        if (fileMissing $file); then
            res=true
        else
            :
        fi
    done
    $res
}
