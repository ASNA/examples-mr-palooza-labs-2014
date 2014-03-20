@echo off
ftp-member -method upload -pcfilename poplab.sql -member poplab -server cypress -library rppallab -sourcefile qsqlsrc -user rogerso -password ASNA
echo palooza.rpg uploaded on %time%