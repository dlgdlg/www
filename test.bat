@echo off

:: ������ �������� ����ƴ��� ���� Ȯ��
bcdedit > null
if '%errorlevel%' NEQ '0' (
	echo ������ �������� ��ġ������ �����Ͽ� �ֽʽÿ�
	pause
	exit
)

set CF=%COMPUTERNAME%_scan_result_%date%_%time%.txt

echo> %CF% 2>&1

echo ***************************************************************************************
echo *			������ ����� ���� �׽�Ʈ 			        	*
echo ***************************************************************************************
echo *	�׸� ���� �ð��� �ٸ� �׸� ���Ͽ� �ټ� ���� �ɸ� �� �ֽ��ϴ� 	      	*
echo *	��ĵ ������ COMPUTERNAME_scan_result_��¥_�ð�.txt ���Ϸ� ���� �˴ϴ�	*
echo *	������ [�ֿ� ������� ��� �ü� ����� �м�, ������] �����Դϴ�		*
echo ****************************************************************************************
echo. 

timeout 3 > NULL

echo **************************************************************************************** >> %CF%
echo *				������ ��ũ��Ʈ				* >> %CF% 
echo **************************************************************************************** >> %CF% 
echo. >> %CF%

echo ######################### ���� �ð� #############################
echo %date%_%time%
echo.

echo ######################### ���� �ð� ############################# >> %CF%
echo %date%_%time% >> %CF%
echo.

echo ====================== �ý��� ���� ========================== >> %CF% 
echo. >> %CF%

echo 1. �ý��� �⺻ ���� >> %CF%
ver | find "." > temp.txt
set /p v= < temp.txt
echo | set /p _os=�ü��	: %v% >> %CF%
echo ȣ��Ʈ �̸�		: %hostname% >> %CF%
echo. >> %CF%

echo 2. ��Ʈ��ũ ���� >> %CF%
ipconfig //all >> %CF%
echo >> %CF%

echo
echo
echo >> %CF%
echo >> %CF%

echo ********************************** ����� üũ ���� ***************************************
echo 

echo ********************************** ����� üũ ���� *************************************** >> %CF%
echo >>%CF%
echo >>%CF%

echo ======================== ���� ���� ===========================
echo ======================== ���� ���� =========================== >> %CF%

echo 01. Administartor ���� �̸� �ٲٱ�
echo 01. Administartor ���� �̸� �ٲٱ� >> %CF%

secedit /EXPORT /CFG LocalSecurityPolicy.txt >nul 2>&1
TYPE LocalSecurityPolicy.txt | findstr /ic:"EnableAdminAccount = 1" >nul 2>&1

if %errorlevel% == 0 (
type LocalSecurityPolicy.txt | findstr /ic:"NewAdministratorName" >nul 2>&1
if %errorlevel% ==0 (
echo [W-01]*[���


echo.
pause