@echo off
color 70
title Windows 8 激活工具 v1.0
echo 还原之前需要把备份的 actbak 文件夹放到桌面上再使用此工具。
echo.
choice /C YN /N /M "继续请按Y，退出请按N："
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto menu

:menu
echo.
echo 1.备份激活信息
echo 2.还原激活信息
choice /C 12 /N /M "请选择：备份激活信息请按1，还原激活信息请按2："
IF ERRORLEVEL 2 goto :restore
IF ERRORLEVEL 1 goto :bakup


:bakup
md %USERPROFILE%\Desktop\actbak
attrib -h "%SYSTEMROOT%\System32\spp\store\data.dat"
copy "%SYSTEMROOT%\System32\spp\store\data.dat" %USERPROFILE%\Desktop\actbak\data.dat
copy "%SYSTEMROOT%\System32\spp\store\cache\cache.dat" %USERPROFILE%\Desktop\actbak\cache.dat
attrib +h "%SYSTEMROOT%\System32\spp\store\data.dat"
echo 激活信息文件备份到桌面上的 actbak 文件夹中。按任意键退出。
pause>nul
exit

:restore
net stop sppsvc
attrib -h "%SYSTEMROOT%\System32\spp\store\data.dat"
copy %USERPROFILE%\Desktop\actbak\data.dat "%SYSTEMROOT%\System32\spp\store\data.dat" /y
copy %USERPROFILE%\Desktop\actbak\cache.dat "%SYSTEMROOT%\System32\spp\store\cache\cache.dat" /y
attrib +h "%SYSTEMROOT%\System32\spp\store\data.dat"
net start sppsvc
echo 还原完毕，按任意键退出。
pause>nul
exit