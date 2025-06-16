[CmdletBinding()]
param (
  [Parameter()]
  [switch] $WhatIf,

  [Parameter()]
  [ValidateSet('nonProd', 'prod')]
  [string] $Environment,
  [string] $BicepFileName,
  [string] $ModulePath,
  [string] $TemplateBasePath
)

$ParamSplat = @{
  location              = 'westus2'
  TemplateFile          = "$TemplateBasePath\LandingZone\$ModulePath\$BicepFileName.bicep"
  TemplateParameterFile = "$TemplateBasePath\LandingZone\$ModulePath\$BicepFileName.bicepparam"
}

if ($WhatIf) {
  $ParamSplat.Add('WhatIf', $true)
}

New-AzSubscriptionDeployment @ParamSplat