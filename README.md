# NetworkCardConfig

This is a script I wrote while I was a Field Engineer back ~2011.
It allowed me to easily set the network card for either Static or DHCP IP configuration.

The BATCH script was designed to be simple and quick to access, and run.

## Configure Script

Before you run the script, you need to check the name of you intended Network Card.
This can be found in Control Panel > Network Connections (Windows 7-based).

Once you've got that, you can then edit the script and update the **netsh int** lines of the script.
For example, netsh int ip show config **"Local Area Connection"**

## Run

When you run the script, make sure it's as Administrator.
Then select from one of two options

1. Set Static IP
2. Set DHCP

When you select **2**, you will be prompted to enter
- IP Address (i.e. 192.168.1.13)
- Subnet Mask (i.e. 255.255.255.0)
- Gateway IP Address (i.e. 192.168.1.254 or leave blank for no gateway)
- Primary DNS IP Address (This only supports One [1] DNS Server)

## Confirm

Once you have configured each of the above, you will be provided confirmation output by the command
*netsh int ip show config*

## Updated Version

This new version of the script is just a update of the same script based on what I have learnt about batch scripting since writing this.
Nothing special, but some more code efficencies.
In today's world, though you would be better off using PowerShell or other specialised utilities.