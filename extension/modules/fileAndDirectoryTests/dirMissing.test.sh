source ../../importsForTesting.sh

thisDir=$(pwd)

if (dirMissing $thisDir); then
    result=${testFailed}
else
    result=${testPassed}
fi
echo -e "${result} finding $thisDir"

noSuchDir="noSuchDir"

if (dirMissing $noSuchDir); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} not finding $noSuchDir"
