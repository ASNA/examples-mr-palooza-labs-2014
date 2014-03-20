@ECHO OFF

REM Use FTP to put or get a source member to or from the IBM i. 
REM Pass either GET or PUT (for upload or download) as the only argument to this batch file.

REM Notes: When you upload a new member for the first time, you'll need to manually
REM add the source member type and text on the IBM i. Once set, these values 
REM persists across uploads. 

REM Warning: The target member is implicitly overridden on either the IBM i or
REM the PC! Be careful. 

REM --------------------------------------------------------------------------
REM Please read this! 
REM --------------------------------------------------------------------------
REM Disclaimer: The fidelity of your source code is your responsibility! Careless use
REM of this file can result in the loss of source code! No warrant is implied or
REM expressed. 

REM I usually make one of these files for each RPG member I'm working with 
REM and keep them in the same folder as the (PC versions of the) RPG source members.
REM --------------------------------------------------------------------------
REM Set the following values to make a member-specfic version of this file.
REM --------------------------------------------------------------------------
SET server=cypress
SET userid=myuserid
SET password=mypassword
SET library=mylib
SET pcfile=palooza.rpg
SET filemember=QRPGLESRC.PALOOZA


if "%1"=="" goto GETPUTARGMISSING
if "%1"=="get" goto FTPGET
if "%1"=="GET" goto FTPGET
if "%1"=="put" goto FTPPUT
if "%1"=="PUT" goto FTPPUT
GOTO GETPUTARGINCORRECT 

:FTPGET
call generate-ftp-script %server% %userid% %password% %library% get %filemember% %pcfile% 
ftp -s:ftp.script
del ftp.script
GOTO END

:FTPPUT
call generate-ftp-script %server% %userid% %password% %library% put %pcfile% %filemember% 
ftp -s:ftp.script
del ftp.script
GOTO END

:GETPUTARGMISSING
echo ---------------------------------------------------------------------------
echo ::Error::
echo You must provide either GET or PUT as the only argument to this batch file.
echo ---------------------------------------------------------------------------
GOTO END

:GETPUTARGINCORRECT
echo ---------------------------------------------------------------------------
echo ::Error::
echo You must provide either GET or PUT as the only argument to this batch file.
echo ---------------------------------------------------------------------------
GOTO END

:END