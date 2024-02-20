# todo: combine with the singular version
fileExistsMulti() {
    # synopsis: fileExistsMulti <arrayOfPaths>
    local -n files=$1
    local res=true
    for file in "${files[@]}"; do
        if (fileMissing $file); then
            res=false
        fi
    done
    $res
}
