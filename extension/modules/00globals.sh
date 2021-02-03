#

bashrcFile=~/.bashrc
bashModDir=~/.bashMod
aliasesDir=$bashModDir/aliases

isBashModded() {
    isBackedUp $bashrcFile
}
