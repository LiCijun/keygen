@echo off
title Windows 8 激活工具 v1.0
color 70
Reg Query "HKLM\SYSTEM\CurrentControlSet\Services\KMService" >nul 2>^&1 && goto uninstq
IF ERRORLEVEL 1 goto instq

:instq
echo 检测到您的系统中未安装KMS服务。
choice /c yn /n /m "安装KMS服务请按Y，退出请按N："
if errorlevel 2 exit
if errorlevel 1 goto inst

:inst
echo 如果有安全软件拦截，请允许。
echo 正在复制文件……
1>nul 2>nul copy /y srvany.exe %SystemRoot%\System32 & 1>nul 2>nul copy /y KMService.exe %SystemRoot% && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 正在安装服务……
sc create KMService binpath= %SystemRoot%\system32\srvany.exe >nul && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 正在更新注册表……
1>nul 2>nul rundll32 advpack,LaunchINFSection service.inf,DefaultInstall,0 && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 正在运行服务……
sc start KMService >nul && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 已完成全部命令。按任意键退出。
pause>nul
exit

:uninstq
echo 检测到您的系统中已安装KMS服务。
choice /c yn /n /m "卸载KMS服务请按Y，退出请按N："
if errorlevel 2 exit
if errorlevel 1 goto uninst

:uninst
echo 如果有安全软件拦截，请允许。
echo 正在关闭进程……
tasklist /fi "imagename eq KMService.exe" 2>nul | find /i /n "KMService.exe" >nul && taskkill /t /f /im KMService.exe 1>nul 2>nul && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 正在停止服务……
sc stop KMService >nul && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 正在卸载服务……
sc delete KMService 1>nul 2>nul && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 正在删除文件……
1>nul 2>nul del %SystemRoot%\System32\srvany.exe & ping -n 3 localhost >nul & 1>nul 2>nul del %SystemRoot%\KMService.exe && echo 成功。
IF ERRORLEVEL 1 echo 错误。
echo.
echo 已完成全部命令。按任意键退出。
pause>nul
exit