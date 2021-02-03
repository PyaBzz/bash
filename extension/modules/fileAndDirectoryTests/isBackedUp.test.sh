source ../../importsForTesting.sh

# Arrange
scratchDir=./scratchDir
mkdir -p $scratchDir

targetFile="$scratchDir/targetFile"
touch $targetFile

unusedFile="$scratchDir/unusedFile"
touch $unusedFile

# Act
backUp $targetFile

# Verify
if (isBackedUp $targetFile); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} finding backup file"

if (isBackedUp $unusedFile); then
    result=${testFailed}
else
    result=${testPassed}
fi
echo -e "${result} not finding backupt for unused file"

# Clean up
rm -rf $scratchDir
