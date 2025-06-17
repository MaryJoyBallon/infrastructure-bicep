[CmdletBinding()]
param (
  [Parameter()]
  [switch] $WhatIf,

  [Parameter()]
  [ValidateSet('nonProd', 'prod')]
  [string] $Environment,
  [string] $TemplateBasePath
)

$ParamSplat = @{
  location              = 'westus2'
#  TemplateFile          = "$TemplateBasePath\LandingZone\$ModulePath\$BicepFileName.bicep"
  TemplateFile          = "$TemplateBasePath\LandingZone\.pipeline\main.bicep"
  TemplateParameterFile = "$TemplateBasePath\LandingZone\.pipeline\main.bicep.bicepparam"
}

if ($WhatIf) {
  $ParamSplat.Add('WhatIf', $true)
}

New-AzSubscriptionDeployment @ParamSplat