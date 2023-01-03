#
# Simple Network Configuration Script
# By Daniel Burrowes - 2011
# Based on script created by Scott D. (http://community.spiceworks.com/how_to/show/320)
#

@echo off
cls
color 74
echo =================================================================
echo   Simple Network Configuration Script
echo =================================================================
echo   Your current interface configuration "Local Area Connection"
netsh int ip show config "Local Area Connection"
echo =================================================================
echo:
echo Please choose from the following:
echo:
echo [1] Set Static IP 
echo [2] Set DHCP 
echo:
echo =================================================================

:choice 

SET /P C=[1,2]? 
for %%? in (1) do if /I "%C%"=="%%?" goto 1 
for %%? in (2) do if /I "%C%"=="%%?" goto 2 
goto choice 


:1 

@echo off 
echo "Please enter Static IP Address Information" 
echo:
echo Enter IPv4 Address: 
set /p IP_Addr=
echo:
echo Enter Default Gateway Address:
set /p D_Gate=
echo:
echo Enter Subnet Mask Address:
set /p Sub_Mask=
echo:
echo Enter Primary DNS Server Address:
set /p PDNS=
echo:
echo Setting Static IP Information... 
netsh int ipv4 set address "Local Area Connection" static %IP_Addr% %Sub_Mask% %D_Gate% 1
netsh int ipv4 set dnsservers "Local Area Connection" static %PDNS% primary no
echo Done!
echo:
echo New IPv4 settings for %computername% - "Local Area Connection":
netsh int ipv4 show config "Local Area Connection".
echo Done!
echo:
pause 
goto end

:2

@ECHO OFF 

echo:
ECHO Resetting IP Address and Subnet Mask For DHCP... 
netsh int ipv4 set address "Local Area Connection" dhcp
echo Done!

echo:

echo Resetting DNS Servers for DHCP...

netsh int ipv4 set dnsservers "Local Area Connection" dhcp

echo Done!

echo:

echo Renewing IP Addresses...
ipconfig /renew | find ""

echo Done!

echo:

echo New IPv4 settings for %computername% - "Local Area Connection": 

netsh int ipv4 show config "Local Area Connection"
echo Done!

echo:

pause 

goto end 

:end

cls

color