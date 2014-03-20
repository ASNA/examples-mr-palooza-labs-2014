call clear-folder %targetfolder%
call clear-folder %targetfolder%
call clear-folder %targetfolder%

"c:\windows\microsoft.net\framework64\v4.0.30319\aspnet_compiler.exe" -v %localhost% -p %sourcefolder% -u -f -fixednames -errorstack %targetfolder%
"c:\program files (x86)\microsoft sdks\windows\v8.0a\bin\netfx 4.0 tools\aspnet_merge.exe" %targetfolder% -prefix core_

del %targetfolder%\web.config
rename %targetfolder%\web.config.production web.config 

"c:\program files (x86)\google\chrome\application\chrome.exe" %url%