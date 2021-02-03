source ../../importsForTesting.sh

# Arrange
scratchDir=./scratchDir
sourceFile="$scratchDir/sourceFile"
targetFile="$scratchDir/targetFile"

mkdir -p $scratchDir

text="b"

echo "a" >$targetFile
echo "c" >>$targetFile
echo "d" >>$targetFile
markerText="a"

# Act
addTextInFileAfterMarker $text $targetFile $markerText

# Verify
targetLine=$(sed '2q;d' $targetFile)

if [ $targetLine == $text ]; then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} inserting into $targetFile"

# Clean up
rm -rf $scratchDir
