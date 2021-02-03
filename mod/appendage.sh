#════════════════════════════  Definitions  ════════════════════════════

repeatSpace() {
    # synopsis: repeatSpace <NumberOfRepetitions>
    local output=""
    for ((i = 1; i <= $1; i++)); do
        output+=" "
    done
    echo "$output"
}

printGreeting() {
    local lineLen=41
    local greeting="Hi $USER !"
    local greetingLen=${#greeting}
    if [ $(($greetingLen % 2)) -eq 0 ]; then
        greeting+=" "
    fi

    local paddingLen=$(((lineLen - greetingLen - 2) / 2))
    padding=$(repeatSpace paddingLen)

    local greetingLine="║$padding$greeting$padding║"
    # ║ ##################################### ║
    # ║ ##################################### ║
    # ║ ########### # ########## # ########## ║
    # ║          ######       ######          ║
    # ║        ##########   ##########        ║
    # ║          ######   #   ######          ║
    # ║            #   ######   #             ║
    # ║              ##########               ║
    # ║                ######                 ║
    # ║                  #                    ║
    # ╠═══════════════════════════════════════╣

    cat <<EOF
╔═══════════════════════════════════════╗
$greetingLine
╚═══════════════════════════════════════╝
EOF
}

setPromptStyle() {
    local e='\[\033[' # Escape sequence
    export PS1="${e}95m\]\u${e}91m\]@${e}96m\]\h:${e}94m\]\w${e}93m\]$ ${e}0m\]"
}

#════════════════════════════  Apply  ════════════════════════════

printGreeting
setPromptStyle

#════════════════════════════  Aliases  ════════════════════════════

for f in ~/.bashMod/aliases/*.sh; do source $f; done
