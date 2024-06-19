source ../source4test.sh

# Definitions
targetDir="$scratchDir/targetDir"
targetFile="$targetDir/targetFile"

backupDir=$targetDir.bazbak
backupFile=$backupDir/targetFile

initialContent="initialContent"
overWriteContent="overWriteContent"

#===============  Arrange  ===============
objective="create backup dir"
mkScratchDir
mkdir -p $targetDir
echo $initialContent >$targetFile

# Act
backUp $targetDir
echo $overWriteContent >$targetFile

# Verify
assertFileExists $backupFile "$objective"

# Verify
objective="match original dir content"
backupContent=$(cat $backupFile)

assertStringEquals $initialContent $backupContent "$objective"

rmScratchDir
