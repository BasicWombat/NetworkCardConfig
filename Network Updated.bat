:: Simple Network Configuration Script
:: By Daniel Burrowes - 2011
:: Updated Jan 2023
:: Based on script created by Scott D. (http://community.spiceworks.com/how_to/show/320)

:: Update this line for your Network Card Name.
set nic="Local Area Connection"
@echo off
cls
color 74

echo =================================================================
echo   Simple Network Configuration Script
echo =================================================================
echo   Your current interface configuration %nic%
netsh int ip show config %nic%
echo =================================================================
echo.
echo Please choose from the following:
echo.
echo [1] Set Static IP 
echo [2] Set DHCP 
echo.
echo =================================================================

:choice 

SET /P C=[1,2]? 
for %%? in (1) do if /I "%C%"=="%%?" goto 1 
for %%? in (2) do if /I "%C%"=="%%?" goto 2 
goto choice 


:1 

@echo off 
echo "Please enter Static IP Address Information" 
echo.
set /p IP_Addr="Enter IPv4 Address: "
echo.
set /p D_Gate="Enter Default Gateway Address: "
echo.
set /p Sub_Mask="Enter Subnet Mask Address: "
echo.
set /p PDNS="Enter Primary DNS Server Address: "
echo.
echo Setting Static IP Information... 
netsh int ipv4 set address %nic% static %IP_Addr% %Sub_Mask% %D_Gate% 1
netsh int ipv4 set dnsservers "%nic% static %PDNS% primary no
echo Done!
echo.
echo New IPv4 settings for %computername% - %nic%:
netsh int ipv4 show config %nic%.
echo Done!
echo.
pause 
goto end

:2

@ECHO OFF 

echo:
ECHO Resetting NIC For DHCP... 
netsh int ipv4 set address %nic% dhcp
netsh int ipv4 set dnsservers %nic% dhcp
echo Done!
echo:

echo Renewing IP Addresses...
ipconfig /renew | find ""

echo Done!

echo:
echo New IPv4 settings for %computername% - %nic%: 
netsh int ipv4 show config %nic%
echo Done!
echo:
pause 

goto end 

:end
cls
color