source ../../importsForTesting.sh

thisFile=$0

if (fileExists $thisFile); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} finding $thisFile"

noSuchFile="noSuchFile"

if (fileExists $noSuchFile); then
    result=${testFailed}
else
    result=${testPassed}
fi
echo -e "${result} not finding $noSuchFile"
