source ../../importsForTesting.sh

# Arrange
scratchDir=./scratchDir
mkdir -p $scratchDir

targetFile="$scratchDir/targetFile"
initialContent="initialContent"
echo $initialContent >$targetFile

backupFile=$targetFile.bazbak

# Act
backUp $targetFile
overWriteContent="overWriteContent"
echo $overWriteContent >$targetFile

# Verify
backupContent=$(cat $backupFile)

if (fileExists $backupFile); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} writing backup to $backupFile"

if [ $backupContent == $initialContent ]; then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} matching backup content with initial content"

# Clean up
rm -rf $scratchDir
