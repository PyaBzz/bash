source ../source4test.sh

scriptName=$0

existingFiles=()
existingFiles+=$scriptName

if (fileMissingMulti existingFiles); then
    result=${testFailed}
else
    result=${testPassed}
fi
echo -e "${result} finding existing files"

missingFiles=()
missingFiles+=("noSuchFile0")
missingFiles+=("noSuchFile1")

if (fileMissingMulti missingFiles); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} noticing missing files"

mixedFiles=()
mixedFiles+=($scriptName)
mixedFiles+=("noSuchFile0")

if (fileMissingMulti mixedFiles); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} spotting missing files among mixed items"
