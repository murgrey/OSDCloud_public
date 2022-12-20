Write-Host  -ForegroundColor Cyan "Starting Custom OSDCloud ..."
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}

Start-OSDCloud -ZTI -Restart -Screenshot -Firmware -OSLanguage en-us -OSVersion 'Windows 10' -OSBuild '22H2' -OSEdition Pro -OSLicense Volume

Write-Host -ForegroundColor Green "Define Computername:"
$TargetComputername = Get-WmiObject Win32_Bios | Select-Object -ExpandProperty SerialNumber

# Update Windows
    UpdateWindows
   
# Update Drivers
    UpdateDrivers

Set-ExecutionPolicy -ExecutionPolicy ByPass -Force

Write-Verbose -Verbose 'Install PowerShell Module AutopilotOOBE'
Install-Module AutopilotOOBE -Force

Write-Verbose -Verbose 'Install PowerShell Script Get-WindowsAutoPilotInfo'
Install-Script -Name Get-WindowsAutoPilotInfo -Force

Write-Verbose 'Run AutopilotOOBE in the new PowerShell window' -Verbose
Start-Sleep -Seconds 5
Start-Process PowerShell.exe

Get-WindowsAutoPilotInfo -Online 

#Restart from WinPE
Read-Host -Prompt "Please remove boot media now and press any key to continue..."
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
