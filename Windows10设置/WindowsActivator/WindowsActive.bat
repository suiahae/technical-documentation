@echo off 
if not "%OS%"=="Windows_NT" exit
title WindosActive

:: Obtain admin rights

if "[%1]" == "[49127c4b-02dc-482e-ac4f-ec4d659b7547]" goto :START_PROCESS
REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1 && goto :START_PROCESS

set command="""%~f0""" 49127c4b-02dc-482e-ac4f-ec4d659b7547
SETLOCAL ENABLEDELAYEDEXPANSION
set "command=!command:'=''!"

powershell -NoProfile Start-Process -FilePath '%COMSPEC%' ^
-ArgumentList '/c """!command!"""' -Verb RunAs 2>NUL

IF %ERRORLEVEL% GTR 0 (
    echo =====================================================
    echo 需要管理员权限！
    echo =====================================================
    echo.
    pause
)

SETLOCAL DISABLEDELAYEDEXPANSION
exit

:: End of Obtain admin rights


:START_PROCESS
cd /D %~dp0
echo WindosActive
echo ====================================
echo Author:feiquan
echo Create:2019/2/12
echo Editor:QianYing
echo UpdataDate:2021/09/08
echo Version:1.1
echo Function:
echo             Windos激活器
echo             可以将已有的序列号输入WindosSerial.ini中进行测试，
echo             在ActiveLog.log中查看激活的详细信息
echo =====================================
pause
cls

set slmgrPath=%SystemRoot%\system32\slmgr.vbs
set pk=null
set KMS=null


if not exist WindowsSerial.ini echo WindowsSerial.ini 文件不存在 && pause && exit
if exist ActiveLog.log del ActiveLog.log >nul

setlocal EnableDelayedExpansion
for /F %%I in (WindowsSerial.ini) do (
	set pk=%%I
	echo 使用密钥：!pk! 测试...
	echo 使用密钥：!pk! 测试...>>ActiveLog.log
	
	echo 卸载产品密钥:>>ActiveLog.log
	cscript /nologo %slmgrPath% /upk >>ActiveLog.log

	echo 从注册表中清除产品密钥^(防止泄露引起的攻击^):>>ActiveLog.log
	cscript /nologo %slmgrPath% /cpky >>ActiveLog.log

	echo 清除所使用的KMS计算机名称^(将端口设置为默认值^):>>ActiveLog.log
	cscript /nologo %slmgrPath% /ckms >>ActiveLog.log

	set KMS=kms.03k.org
	echo 设置KMS计算机名称为：!KMS!>>ActiveLog.log
	cscript /nologo %slmgrPath% /skms !KMS! >>ActiveLog.log

	echo 开始使用密钥：!pk! 激活 >>ActiveLog.log
	cscript /nologo %slmgrPath% /ipk  !pk! >>ActiveLog.log
	cscript /nologo %slmgrPath% /ato  >>ActiveLog.log
	
	echo ++++++++++++++++++++++++++++++>>ActiveLog.log
	
	(
		(
			more ActiveLog.log | find "成功地激活了产品。" >nul && (
			echo !pk! 成功地激活了产品。
			cscript /nologo %slmgrPath% /dlv  | more
			%slmgrPath% /xpr
			pause
			exit
			) 
		) || (
			more ActiveLog.log | find "Product activated successfully." >nul && (
			echo !pk! Product activated successfully.
			cscript /nologo %slmgrPath% /dlv  | more
			%slmgrPath% /xpr
			pause
			exit
			) 
		) 
	) || echo 			Defeated&&echo.
	
)
setlocal DisableDelayedExpansion
echo WindosSerial.ini 中的所有的序列号都测试失败，请重新查找新的 Windows 密钥输入到 WindosSerial.ini 进行激活
exit


