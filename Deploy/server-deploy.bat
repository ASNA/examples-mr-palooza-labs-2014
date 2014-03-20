call clear-folder %previousserverfolder%
call clear-folder %previousserverfolder%
call clear-folder %previousserverfolder%

rem Save current version in an archive location.
xcopy %targetserverfolder%\*.* %previousserverfolder% /s 

call clear-folder %targetserverfolder%
call clear-folder %targetserverfolder%
call clear-folder %targetserverfolder%

rem Copy app from staging location to server.
xcopy %sourcefolder%\*.* %targetserverfolder% /s
"c:\program files (x86)\google\chrome\application\chrome.exe" %url%

pause