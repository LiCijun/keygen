@color 3F
@echo.
@echo ===== Windows 8 RTM KMS 激活 =====
@echo.
@echo ===== 请右键以管理员身份运行，如果没有请重新运行 =====
@echo.

@echo off
set /p choice="继续请按[Y]回车，退出请按[N]回车"
if %choice%==n goto na
if %choice%==y goto ya

:ya
@echo.
@echo 1. Win8 企业版请按 [1]
@echo.
@echo 2. Win8 专业版请按 [2]
@echo.
@echo 3. Win8 专业版 WMC 请按 [3]
@echo.
@echo off
set /p choice="请选择对应版本按 [1] 或 [2] 或 [3] 回车"
if %choice%==1 goto a1
if %choice%==2 goto a2
if %choice%==3 goto a3

:a1
rem Win 8 Enterprise
@echo.
@echo 等待“操作完成按任意键退出程序！”方可退出。
@echo.
@echo 激活过程会有弹窗，需要等待片刻！
@echo.
@slmgr /ipk 32JNW-9KQ84-P47T8-D8GGY-CWCK7
@slmgr /skms 147.134.1.42
@slmgr.vbs -ato
@slmgr /dli
@slmgr /ckms
@echo.
@echo 操作完成按任意键退出程序！
@echo.
@pause >nul
exit

:a2
rem Win 8 Pro
@echo.
@echo 等待“操作完成按任意键退出程序！”方可退出。
@echo.
@echo 激活过程会有弹窗，需要等待片刻！
@echo.
@slmgr /ipk NG4HW-VH26C-733KW-K6F98-J8CK4
@slmgr /skms 147.134.1.42
@slmgr.vbs -ato
@slmgr /dli
@slmgr /ckms
@echo.
@echo 操作完成按任意键退出程序！
@echo.
@pause >nul
exit

:a3
rem Win 8 ProWMC
@echo.
@echo 等待“操作完成按任意键退出程序！”方可退出。
@echo.
@echo 激活过程会有弹窗，需要等待片刻！
@echo.
@slmgr /ipk GNBB8-YVD74-QJHX6-27H4K-8QHDG 
@slmgr /skms 147.134.1.42
@slmgr.vbs -ato
@slmgr /dli
@slmgr /ckms
@echo.
@echo 操作完成按任意键退出程序！
@echo.
@pause >nul
exit

:na
@echo.
@echo 按任意键退出程序！
@echo.
@pause >nul
exit
