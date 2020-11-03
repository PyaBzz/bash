askUserClear() {
    # synopsis: askUser [<QuestionString>]
    clear
    printLine 60 "#"
    askUser "$1"
}

askUser() {
    # synopsis: askUser [<QuestionString>]
    if [ -z "$1" ]; then
        local confirm
        read -p "Proceed? (Y/N): " confirm
    else
        read -p "$1 (Y/N): " confirm
    fi

    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        true
    else
        false
    fi
}

askUserChoice() {
    # synopsis: askUserChoice [<option1> <option2> <option3>] <promptMessage> 
    clear
    local optionsCount="$(($# - 1))"
    local choice=0

    for index in $(seq 1 $optionsCount); do
        echo "$index: ${!index}"
    done

    while :; do
        read -p "${!#}" choice # gets the last parameter

        if [[ $choice =~ ^[0-9]+$ ]]; then
            : # do nothing
        else
            echo "Invalid number"
            continue
        fi

        if (($choice < 1 || $choice > $optionsCount)); then
            echo "Number out of range"
        else
            break
        fi
    done

    return $choice
}
