@echo off
ver|find "6.2.920">nul &&if errorlevel 0 start activator.exe & exit
start wscript.exe err.vbs
exit