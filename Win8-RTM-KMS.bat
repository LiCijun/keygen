@color 3F
@echo.
@echo ===== Windows 8 RTM KMS ���� =====
@echo.
@echo ===== ���Ҽ��Թ���Ա������У����û������������ =====
@echo.

@echo off
set /p choice="�����밴[Y]�س����˳��밴[N]�س�"
if %choice%==n goto na
if %choice%==y goto ya

:ya
@echo.
@echo 1. Win8 ��ҵ���밴 [1]
@echo.
@echo 2. Win8 רҵ���밴 [2]
@echo.
@echo 3. Win8 רҵ�� WMC �밴 [3]
@echo.
@echo off
set /p choice="��ѡ���Ӧ�汾�� [1] �� [2] �� [3] �س�"
if %choice%==1 goto a1
if %choice%==2 goto a2
if %choice%==3 goto a3

:a1
rem Win 8 Enterprise
@echo.
@echo �ȴ���������ɰ�������˳����򣡡������˳���
@echo.
@echo ������̻��е�������Ҫ�ȴ�Ƭ�̣�
@echo.
@slmgr /ipk 32JNW-9KQ84-P47T8-D8GGY-CWCK7
@slmgr /skms 147.134.1.42
@slmgr.vbs -ato
@slmgr /dli
@slmgr /ckms
@echo.
@echo ������ɰ�������˳�����
@echo.
@pause >nul
exit

:a2
rem Win 8 Pro
@echo.
@echo �ȴ���������ɰ�������˳����򣡡������˳���
@echo.
@echo ������̻��е�������Ҫ�ȴ�Ƭ�̣�
@echo.
@slmgr /ipk NG4HW-VH26C-733KW-K6F98-J8CK4
@slmgr /skms 147.134.1.42
@slmgr.vbs -ato
@slmgr /dli
@slmgr /ckms
@echo.
@echo ������ɰ�������˳�����
@echo.
@pause >nul
exit

:a3
rem Win 8 ProWMC
@echo.
@echo �ȴ���������ɰ�������˳����򣡡������˳���
@echo.
@echo ������̻��е�������Ҫ�ȴ�Ƭ�̣�
@echo.
@slmgr /ipk GNBB8-YVD74-QJHX6-27H4K-8QHDG 
@slmgr /skms 147.134.1.42
@slmgr.vbs -ato
@slmgr /dli
@slmgr /ckms
@echo.
@echo ������ɰ�������˳�����
@echo.
@pause >nul
exit

:na
@echo.
@echo ��������˳�����
@echo.
@pause >nul
exit
