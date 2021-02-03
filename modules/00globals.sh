#
bashrcFile=$HOME/.bashrc
bashModDir=$HOME/.bashMod
aliasesDir=$bashModDir/aliases

isBashModded() {
    isBackedUp $bashrcFile
}
