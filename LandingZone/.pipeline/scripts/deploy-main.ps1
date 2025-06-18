[CmdletBinding()]
param (
  [Parameter()]
  [switch] $WhatIf,

  [Parameter()]
  [string] $ModulePath,
  [string] $TemplateBasePath
)

$ParamSplat = @{
  location              = 'westus2'
#  TemplateFile          = "$TemplateBasePath\LandingZone\$ModulePath\$BicepFileName.bicep"
  TemplateFile          = "$TemplateBasePath\LandingZone\Stacks\test-stack\main.bicep"
  TemplateParameterFile = "$TemplateBasePath\LandingZone\$ModulePath\example.bicepparam"
}

if ($WhatIf) {
  $ParamSplat.Add('WhatIf', $true)
}

New-AzSubscriptionDeployment @ParamSplat