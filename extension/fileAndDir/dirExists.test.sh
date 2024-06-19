source ../source4test.sh

thisDir=$(pwd)

if (dirExists $thisDir); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} finding $thisDir"

noSuchDir="noSuchDir"

if (dirExists $noSuchDir); then
    result=${testFailed}
else
    result=${testPassed}
fi
echo -e "${result} not finding $noSuchDir"
