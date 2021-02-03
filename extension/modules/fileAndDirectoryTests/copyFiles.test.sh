source ../../importsForTesting.sh

# Arrange
scratchDir=./scratchDir
mkdir -p $scratchDir

source0="$scratchDir/source0"
touch $source0
source1="$scratchDir/source1"
touch $source1
source2="$scratchDir/source2"
touch $source2

sourceFiles=()
sourceFiles+=($source0)
sourceFiles+=($source1)
sourceFiles+=($source2)

target0="$scratchDir/target0"
target1="$scratchDir/target1"
target2="$scratchDir/target2"

targetFiles=()
targetFiles+=($target0)
targetFiles+=($target1)
targetFiles+=($target2)

copyFiles sourceFiles to targetFiles

if (allFilesExist targetFiles); then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} copying all"

rm -rf $scratchDir
