Write-Host  -ForegroundColor Cyan "Starting Custom OSDCloud ..."
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}

 $Global:OSDCloud = @{
    ApplyManufacturerDrivers = $True
    ApplyCatalogDrivers = $True
    ApplyCatalogFirmware = $True
    OSBuild = '22H2' 
    OSName = 'Windows 10 22H2 x64'
    OSEdition = 'Pro'
    OSEditionId = 8
    OSVersion = 'Windows 10'
    ScreenshotCapture = $True 
    ZTI = $True 
 }

  $Global:MyOSDCloud = @{
    ApplyManufacturerDrivers = $True
    ApplyCatalogDrivers = $True
    ApplyCatalogFirmware = $True
    OSBuild = '22H2' 
    OSName = 'Windows 10 22H2 x64'
    OSEdition = 'Pro'
    OSEditionId = 8
    OSVersion = 'Windows 10'
    ScreenshotCapture = $True 
    ZTI = $True 
 }
