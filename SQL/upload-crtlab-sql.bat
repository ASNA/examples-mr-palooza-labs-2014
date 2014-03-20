@echo off
ftp-member -method upload -pcfilename crtlab.sql -member crtlab -server cypress -library rppallab -sourcefile qsqlsrc -user rogerso -password ASNA
echo palooza.rpg uploaded on %time%