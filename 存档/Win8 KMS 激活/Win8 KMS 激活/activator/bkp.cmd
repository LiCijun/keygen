@echo off
color 70
title Windows 8 ����� v1.0
echo ��ԭ֮ǰ��Ҫ�ѱ��ݵ� actbak �ļ��зŵ���������ʹ�ô˹��ߡ�
echo.
choice /C YN /N /M "�����밴Y���˳��밴N��"
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto menu

:menu
echo.
echo 1.���ݼ�����Ϣ
echo 2.��ԭ������Ϣ
choice /C 12 /N /M "��ѡ�񣺱��ݼ�����Ϣ�밴1����ԭ������Ϣ�밴2��"
IF ERRORLEVEL 2 goto :restore
IF ERRORLEVEL 1 goto :bakup


:bakup
md %USERPROFILE%\Desktop\actbak
attrib -h "%SYSTEMROOT%\System32\spp\store\data.dat"
copy "%SYSTEMROOT%\System32\spp\store\data.dat" %USERPROFILE%\Desktop\actbak\data.dat
copy "%SYSTEMROOT%\System32\spp\store\cache\cache.dat" %USERPROFILE%\Desktop\actbak\cache.dat
attrib +h "%SYSTEMROOT%\System32\spp\store\data.dat"
echo ������Ϣ�ļ����ݵ������ϵ� actbak �ļ����С���������˳���
pause>nul
exit

:restore
net stop sppsvc
attrib -h "%SYSTEMROOT%\System32\spp\store\data.dat"
copy %USERPROFILE%\Desktop\actbak\data.dat "%SYSTEMROOT%\System32\spp\store\data.dat" /y
copy %USERPROFILE%\Desktop\actbak\cache.dat "%SYSTEMROOT%\System32\spp\store\cache\cache.dat" /y
attrib +h "%SYSTEMROOT%\System32\spp\store\data.dat"
net start sppsvc
echo ��ԭ��ϣ���������˳���
pause>nul
exit