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
    echo ��Ҫ����ԱȨ�ޣ�
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
echo             Windos������
echo             ���Խ����е����к�����WindosSerial.ini�н��в��ԣ�
echo             ��ActiveLog.log�в鿴�������ϸ��Ϣ
echo =====================================
pause
cls

set slmgrPath=%SystemRoot%\system32\slmgr.vbs
set pk=null
set KMS=null


if not exist WindowsSerial.ini echo WindowsSerial.ini �ļ������� && pause && exit
if exist ActiveLog.log del ActiveLog.log >nul

setlocal EnableDelayedExpansion
for /F %%I in (WindowsSerial.ini) do (
	set pk=%%I
	echo ʹ����Կ��!pk! ����...
	echo ʹ����Կ��!pk! ����...>>ActiveLog.log
	
	echo ж�ز�Ʒ��Կ:>>ActiveLog.log
	cscript /nologo %slmgrPath% /upk >>ActiveLog.log

	echo ��ע����������Ʒ��Կ^(��ֹй¶����Ĺ���^):>>ActiveLog.log
	cscript /nologo %slmgrPath% /cpky >>ActiveLog.log

	echo �����ʹ�õ�KMS���������^(���˿�����ΪĬ��ֵ^):>>ActiveLog.log
	cscript /nologo %slmgrPath% /ckms >>ActiveLog.log

	set KMS=kms.03k.org
	echo ����KMS���������Ϊ��!KMS!>>ActiveLog.log
	cscript /nologo %slmgrPath% /skms !KMS! >>ActiveLog.log

	echo ��ʼʹ����Կ��!pk! ���� >>ActiveLog.log
	cscript /nologo %slmgrPath% /ipk  !pk! >>ActiveLog.log
	cscript /nologo %slmgrPath% /ato  >>ActiveLog.log
	
	echo ++++++++++++++++++++++++++++++>>ActiveLog.log
	
	(
		(
			more ActiveLog.log | find "�ɹ��ؼ����˲�Ʒ��" >nul && (
			echo !pk! �ɹ��ؼ����˲�Ʒ��
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
echo WindosSerial.ini �е����е����кŶ�����ʧ�ܣ������²����µ� Windows ��Կ���뵽 WindosSerial.ini ���м���
exit


