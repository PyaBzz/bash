askUserClear() {
    # synopsis: askUser [<QuestionString>]
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
    # In the calling code use the global variable 'choice' to read the result
    clear
    local optionsCount="$(($# - 1))"
    choice=0

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
}

askToProceed() {
    # synopsis: askToProceed [<QuestionString>]
    # Negative answer aborts the entire script execution
    if (askUserClear "$1"); then
        :
    else
        echo "Aborted"
        exit
    fi
}

askRunFunc() {
    # synopsis: askRunFunc <FuncName> [<QuestionString>]
    # Negative answer skips func execution
    if (askUser "$2"); then
        $1
        echo "$2 Done."
    else
        echo "Skipped"
    fi
}
