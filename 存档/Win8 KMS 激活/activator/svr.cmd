@echo off
title Windows 8 ����� v1.0
color 70
Reg Query "HKLM\SYSTEM\CurrentControlSet\Services\KMService" >nul 2>^&1 && goto uninstq
IF ERRORLEVEL 1 goto instq

:instq
echo ��⵽����ϵͳ��δ��װKMS����
choice /c yn /n /m "��װKMS�����밴Y���˳��밴N��"
if errorlevel 2 exit
if errorlevel 1 goto inst

:inst
echo ����а�ȫ������أ�������
echo ���ڸ����ļ�����
1>nul 2>nul copy /y srvany.exe %SystemRoot%\System32 & 1>nul 2>nul copy /y KMService.exe %SystemRoot% && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo ���ڰ�װ���񡭡�
sc create KMService binpath= %SystemRoot%\system32\srvany.exe >nul && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo ���ڸ���ע�����
1>nul 2>nul rundll32 advpack,LaunchINFSection service.inf,DefaultInstall,0 && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo �������з��񡭡�
sc start KMService >nul && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo �����ȫ�������������˳���
pause>nul
exit

:uninstq
echo ��⵽����ϵͳ���Ѱ�װKMS����
choice /c yn /n /m "ж��KMS�����밴Y���˳��밴N��"
if errorlevel 2 exit
if errorlevel 1 goto uninst

:uninst
echo ����а�ȫ������أ�������
echo ���ڹرս��̡���
tasklist /fi "imagename eq KMService.exe" 2>nul | find /i /n "KMService.exe" >nul && taskkill /t /f /im KMService.exe 1>nul 2>nul && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo ����ֹͣ���񡭡�
sc stop KMService >nul && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo ����ж�ط��񡭡�
sc delete KMService 1>nul 2>nul && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo ����ɾ���ļ�����
1>nul 2>nul del %SystemRoot%\System32\srvany.exe & ping -n 3 localhost >nul & 1>nul 2>nul del %SystemRoot%\KMService.exe && echo �ɹ���
IF ERRORLEVEL 1 echo ����
echo.
echo �����ȫ�������������˳���
pause>nul
exit