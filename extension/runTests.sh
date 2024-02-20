source ./source4test.sh

clear

for f in $(find . -name "*.test.sh"); do
    dirName=$(dirname $f)
    fileName=$(basename $f)
    cd $dirName
    printLine 0
    printTestName $f
    ./$fileName
    cd - > /dev/null
done
