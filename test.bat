@echo off

:: 관리자 권한으로 실행됐는지 여부 확인
bcdedit > null
if '%errorlevel%' NEQ '0' (
	echo 관리자 권한으로 배치파일을 실행하여 주십시오
	pause
	exit
)

set CF=%COMPUTERNAME%_scan_result_%date%_%time%.txt

echo> %CF% 2>&1

echo ***************************************************************************************
echo *			윈도우 취약점 진단 테스트 			        	*
echo ***************************************************************************************
echo *	항목에 따라 시간이 다른 항목에 비하여 다소 오래 걸릴 수 있습니다 	      	*
echo *	스캔 보고서는 COMPUTERNAME_scan_result_날짜_시간.txt 파일로 저장 됩니다	*
echo *	기준은 [주요 정보통신 기반 시설 취약점 분석, 평기기준] 문서입니다		*
echo ****************************************************************************************
echo. 

timeout 3 > NULL

echo **************************************************************************************** >> %CF%
echo *				윈도우 스크립트				* >> %CF% 
echo **************************************************************************************** >> %CF% 
echo. >> %CF%

echo ######################### 시작 시간 #############################
echo %date%_%time%
echo.

echo ######################### 시작 시간 ############################# >> %CF%
echo %date%_%time% >> %CF%
echo.

echo ====================== 시스템 정보 ========================== >> %CF% 
echo. >> %CF%

echo 1. 시스템 기본 정보 >> %CF%
ver | find "." > temp.txt
set /p v= < temp.txt
echo | set /p _os=운영체제	: %v% >> %CF%
echo 호스트 이름		: %hostname% >> %CF%
echo. >> %CF%

echo 2. 네트워크 정보 >> %CF%
ipconfig //all >> %CF%
echo >> %CF%

echo
echo
echo >> %CF%
echo >> %CF%

echo ********************************** 취약점 체크 시작 ***************************************
echo 

echo ********************************** 취약점 체크 시작 *************************************** >> %CF%
echo >>%CF%
echo >>%CF%

echo ======================== 계정 관리 ===========================
echo ======================== 계정 관리 =========================== >> %CF%

echo 01. Administartor 계정 이름 바꾸기
echo 01. Administartor 계정 이름 바꾸기 >> %CF%

secedit /EXPORT /CFG LocalSecurityPolicy.txt >nul 2>&1
TYPE LocalSecurityPolicy.txt | findstr /ic:"EnableAdminAccount = 1" >nul 2>&1

if %errorlevel% == 0 (
type LocalSecurityPolicy.txt | findstr /ic:"NewAdministratorName" >nul 2>&1
if %errorlevel% ==0 (
echo [W-01]*[취약


echo.
pause