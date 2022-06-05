## Using Invoke-RestMethod
$webAPIData = Invoke-RestMethod -Uri "https://api.github.com/repos/SuperCraftAlex/AdvancedWindowsConsole/releases/latest"

## The download information is stored in the "assets" section of the data
$assets = $webAPIData.tag_name

Write-Output $assets