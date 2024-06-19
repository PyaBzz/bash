source ../source4test.sh

#===============  Arrange  ===============
mkScratchDir

sourceFiles=(
    $(addToScratchDir src0)
    $(addToScratchDir src1)
    $(addToScratchDir src2)
)

targetFiles=(
    "$scratchDir/src0.bazbak"
    "$scratchDir/src1.bazbak"
    "$scratchDir/src2.bazbak"
)

backupMulti sourceFiles

if (fileExistsMulti targetFiles); then
    printTestSuccess "backing-up all"
else
    printTestFail "backing-up all"
fi

rmScratchDir
