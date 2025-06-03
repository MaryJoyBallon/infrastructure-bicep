[CmdletBinding()]
param (
  [Parameter()]
  [switch] $WhatIf
)

$ParamSplat = @{
  #Required
  location              = "eastus"
  TemplateFile          = '$(System.DefaultWorkingDirectory)\bicep\main.bicep'
  TemplateParameterFile = '$(System.DefaultWorkingDirectory)\bicep\parameters\main.dev.bicepparam'
}
If ($Whatif ) {
  $ParamSplat.Add('WhatIf', $true)
}

New-AzSubscriptionDeployment @ParamSplat
