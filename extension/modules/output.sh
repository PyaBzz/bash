colourNc='\e[0m'
colourRed='\e[1;31;40m'
colourGreen='\e[1;32;40m'
colourCyan='\e[1;36;40m'
colourPurple='\e[0;35;40m'

repeatText() {
    # synopsis: repeatText <NumberOfRepetitions> [<StringToRepeat>]
    local stringToRepeat=" "

    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi

    for ((i = 1; i <= $1; i++)); do
        printf "$stringToRepeat"
    done
}

echoRepeatText() {
    # synopsis: echoRepeatText <NumberOfRepetitions> [<StringToRepeat>]
    local stringToRepeat=" "

    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi
    local output=""
    for ((i = 1; i <= $1; i++)); do
        output+="$stringToRepeat"
    done
    echo "$output"
}

printLine() {
    # synopsis: printLine <LineLengthInCharacters> [<StringToRepeat>]
    local stringToRepeat="═"

    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi

    echoRepeatText $1 $stringToRepeat
}

printColours() {
    for x in {0..8}; do
        for i in {30..37}; do
            for a in {40..47}; do
                echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
            done
            echo
        done
    done
    echo ""
}

postInUpRightCorner() {
    local len=${#1}
    local colour='\033[30;42m'

    tput sc
    tput cup 0 $(($(tput cols) - len))
    printf "${colour}$1"
    tput rc
}

showDateTime() {
    # synopsis: showDateTime &
    # The ampersand runs it in background
    while sleep 1; do
        postInUpRightCorner "$(date +"%F @ %T")"
    done
}
