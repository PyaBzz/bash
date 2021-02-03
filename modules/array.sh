shopt -s expand_aliases

# alias _Array.getByRef='
# e="$( declare -p ${1} )"
# eval "declare -A _Array=${e#*=}"
# '

# array.keys() {
#     array.getByRef
#     KEYS=(${!_Array[@]})
# }   

# # alias array.foreach='array.keys ${1}; for key in "${KEYS[@]}"'

# #Todo: Develop and test
# alias _Array.forEachKey='
# array.keys ${1};
# for key in ${KEYS[@]};'
