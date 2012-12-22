@echo off
color 70
title Windows 8 激活工具 v1.0
echo 即将重置Windows激活，是否继续？
choice /c yn /n /m "继续请按Y，退出请按N"
if errorlevel 2 exit
if errorlevel 1 goto rea

:rea
slmgr.vbs -rearm
wscript.exe %windir%\system32\slmgr.vbs /dlv
echo 重置完毕。按任意键退出。
pause>nul
exit