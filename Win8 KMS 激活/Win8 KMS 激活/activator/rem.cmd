@echo off
color 70
title Windows 8 ����� v1.0
echo ��������Windows����Ƿ������
choice /c yn /n /m "�����밴Y���˳��밴N"
if errorlevel 2 exit
if errorlevel 1 goto rea

:rea
slmgr.vbs -rearm
wscript.exe %windir%\system32\slmgr.vbs /dlv
echo ������ϡ���������˳���
pause>nul
exit