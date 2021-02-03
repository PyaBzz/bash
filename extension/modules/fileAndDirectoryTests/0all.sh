source ../../importsForTesting.sh

clear

for f in ./*.test.sh; do
    printLine 0
    printTestName $f
    ./$f
done
