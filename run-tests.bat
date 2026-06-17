@echo off
REM Playwright + Allure Automation Helper Script
REM Run this file to quickly execute common commands

:menu
cls
echo.
echo ========================================
echo Playwright + Allure Automation Suite
echo ========================================
echo.
echo 1. Install dependencies (one-time)
echo 2. Run all tests
echo 3. Run tests in headed mode (see browser)
echo 4. Generate Allure report
echo 5. Open Allure report
echo 6. Run specific test file
echo 7. Run specific test case
echo 8. View Playwright report
echo 9. Clean results and reports
echo 0. Exit
echo.
set /p choice="Enter your choice (0-9): "

if "%choice%"=="1" goto install
if "%choice%"=="2" goto runtest
if "%choice%"=="3" goto headed
if "%choice%"=="4" goto allure_gen
if "%choice%"=="5" goto allure_open
if "%choice%"=="6" goto specific_file
if "%choice%"=="7" goto specific_test
if "%choice%"=="8" goto pw_report
if "%choice%"=="9" goto clean
if "%choice%"=="0" goto end

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto menu

:install
echo.
echo Installing dependencies...
call npm install
echo.
echo Installing Playwright browsers...
call npx playwright install chromium
echo.
echo Installation complete!
pause
goto menu

:runtest
echo.
echo Setting environment variables...
set PATH=%PATH%;C:\Program Files\nodejs
echo.
echo Running all tests...
call npm test
echo.
pause
goto menu

:headed
echo.
echo Setting environment variables...
set PATH=%PATH%;C:\Program Files\nodejs
echo.
echo Running tests in headed mode...
call npm run test:headed
echo.
pause
goto menu

:allure_gen
echo.
echo Setting environment variables...
set PATH=%PATH%;C:\Program Files\nodejs
set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot
set PATH=%PATH%;%JAVA_HOME%\bin
echo.
echo Generating Allure report...
call npm run allure:generate
echo.
echo Report generated successfully!
pause
goto menu

:allure_open
echo.
echo Setting environment variables...
set PATH=%PATH%;C:\Program Files\nodejs
set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot
set PATH=%PATH%;%JAVA_HOME%\bin
echo.
echo Opening Allure report...
call npm run allure:open
echo.
pause
goto menu

:specific_file
echo.
set PATH=%PATH%;C:\Program Files\nodejs
echo Enter test file path (e.g., tests/cargo-scanning.spec.js):
set /p testfile="File path: "
echo.
echo Running %testfile%...
call npx playwright test %testfile%
echo.
pause
goto menu

:specific_test
echo.
set PATH=%PATH%;C:\Program Files\nodejs
echo Enter test name pattern (e.g., "should load login page"):
set /p testname="Test name: "
echo.
echo Running test matching: %testname%
call npx playwright test --grep "%testname%"
echo.
pause
goto menu

:pw_report
echo.
set PATH=%PATH%;C:\Program Files\nodejs
echo Opening Playwright HTML report...
call npx playwright show-report
echo.
pause
goto menu

:clean
echo.
echo Cleaning results and reports...
if exist allure-results rmdir /s /q allure-results
if exist allure-report rmdir /s /q allure-report
if exist test-results rmdir /s /q test-results
if exist playwright-report rmdir /s /q playwright-report
echo Cleanup complete!
echo.
pause
goto menu

:end
echo.
echo Goodbye!
exit /b 0
