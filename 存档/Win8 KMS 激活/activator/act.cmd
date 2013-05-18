@echo off
title Windows 8 激活工具 v1.0
color 70
Reg Query "HKLM\SYSTEM\CurrentControlSet\Services\KMService" >nul 2>^&1 && goto menu
IF ERRORLEVEL 1 echo 检测到您未安装KMS服务。请回到主界面安装服务。 & pause>nul & exit

:menu
echo 请选择您的操作系统版本：
echo 1.Windows 8 专业版
echo 2.Windows 8 专业版 (带 Windows Media Center)
echo 3.Windows 8 企业版
echo 其他版本的支持将在新版本中启用。
set /p sku="输入操作系统序号并回车："
if %sku%==1 goto pro
if %sku%==2 goto prowmc
if %sku%==3 goto ent

:pro
echo 请稍等片刻完成激活。
echo.
wscript.exe %windir%\system32\slmgr.vbs /ipk NG4HW-VH26C-733KW-K6F98-J8CK4
wscript.exe %windir%\system32\slmgr.vbs /skms 127.0.0.1:1688
wscript.exe %windir%\system32\slmgr.vbs /ato
echo 已完成激活。按任意键显示激活信息，本程序将退出。
pause>nul
start wscript.exe %windir%\system32\slmgr.vbs /dlv
exit

:prowmc
echo 请稍等片刻完成激活。
echo.
wscript.exe %windir%\system32\slmgr.vbs /ipk GNBB8-YVD74-QJHX6-27H4K-8QHDG
wscript.exe %windir%\system32\slmgr.vbs /skms 127.0.0.1:1688
wscript.exe %windir%\system32\slmgr.vbs /ato
echo 已完成激活。按任意键显示激活信息，本程序将退出。
pause>nul
start wscript.exe %windir%\system32\slmgr.vbs /dlv
exit

:ent
echo 请稍等片刻完成激活。
echo.
wscript.exe %windir%\system32\slmgr.vbs /skms 127.0.0.1:1688
wscript.exe %windir%\system32\slmgr.vbs /ato
echo 已完成激活。按任意键显示激活信息，本程序将退出。
pause>nul
start wscript.exe %windir%\system32\slmgr.vbs /dlv
exit