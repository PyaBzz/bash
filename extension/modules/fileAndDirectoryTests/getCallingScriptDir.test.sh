source ../../importsForTesting.sh

scriptDir=$(pwd)
result=$(getCallingScriptDir) #In this case it is the same as running script directory

echo $scriptDir
echo $result

if [ $scriptDir == $result ]; then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} getting directory"
