@echo off
title Windows 8 ����� v1.0
color 70
Reg Query "HKLM\SYSTEM\CurrentControlSet\Services\KMService" >nul 2>^&1 && goto menu
IF ERRORLEVEL 1 echo ��⵽��δ��װKMS������ص������氲װ���� & pause>nul & exit

:menu
echo ��ѡ�����Ĳ���ϵͳ�汾��
echo 1.Windows 8 רҵ��
echo 2.Windows 8 רҵ�� (�� Windows Media Center)
echo 3.Windows 8 ��ҵ��
echo �����汾��֧�ֽ����°汾�����á�
set /p sku="�������ϵͳ��Ų��س���"
if %sku%==1 goto pro
if %sku%==2 goto prowmc
if %sku%==3 goto ent

:pro
echo ���Ե�Ƭ����ɼ��
echo.
wscript.exe %windir%\system32\slmgr.vbs /ipk NG4HW-VH26C-733KW-K6F98-J8CK4
wscript.exe %windir%\system32\slmgr.vbs /skms 127.0.0.1:1688
wscript.exe %windir%\system32\slmgr.vbs /ato
echo ����ɼ�����������ʾ������Ϣ���������˳���
pause>nul
start wscript.exe %windir%\system32\slmgr.vbs /dlv
exit

:prowmc
echo ���Ե�Ƭ����ɼ��
echo.
wscript.exe %windir%\system32\slmgr.vbs /ipk GNBB8-YVD74-QJHX6-27H4K-8QHDG
wscript.exe %windir%\system32\slmgr.vbs /skms 127.0.0.1:1688
wscript.exe %windir%\system32\slmgr.vbs /ato
echo ����ɼ�����������ʾ������Ϣ���������˳���
pause>nul
start wscript.exe %windir%\system32\slmgr.vbs /dlv
exit

:ent
echo ���Ե�Ƭ����ɼ��
echo.
wscript.exe %windir%\system32\slmgr.vbs /skms 127.0.0.1:1688
wscript.exe %windir%\system32\slmgr.vbs /ato
echo ����ɼ�����������ʾ������Ϣ���������˳���
pause>nul
start wscript.exe %windir%\system32\slmgr.vbs /dlv
exit