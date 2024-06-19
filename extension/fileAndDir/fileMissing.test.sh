source ../source4test.sh

scriptFile=$0

if (fileMissing $scriptFile); then
    result=${testFailed}
else
    result=${testPassed}
fi
echo -e "${result} finding $scriptFile"

nonExistentFile="nonExistentFile"

if (fileMissing $nonExistentFile); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} not finding $nonExistentFile"
