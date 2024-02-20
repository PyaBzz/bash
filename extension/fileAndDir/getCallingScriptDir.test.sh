source ../source4test.sh

scriptDir=$(pwd)
result=$(getCallingScriptDir) #In this case it is the same as running script directory

if [ $scriptDir == $result ]; then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} getting directory"
