source ../source4test.sh

# Definitions
targetFile="$scratchDir/targetFile"
backupFile=$targetFile.bazbak
initialContent="initialContent"
overWriteContent="overWriteContent"

#===============  Arrange  ===============
objective="create backup file"
mkScratchDir
echo $initialContent >$targetFile

# Act
backUp $targetFile
echo $overWriteContent >$targetFile

# Verify
assertFileExists $backupFile "$objective"

# Verify
objective="match original file content"
backupContent=$(cat $backupFile)

assertStringEquals $initialContent $backupContent "$objective"

rmScratchDir
