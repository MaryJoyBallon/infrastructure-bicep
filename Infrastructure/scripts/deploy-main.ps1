[CmdletBinding()]
param (
  [Parameter()]
  [switch] $WhatIf,

  [Parameter()]
  [ValidateSet('dev', 'prod')]
  [string] $Environment,
  [string] $Region,
  [string] $TemplateBasePath
)

$ParamSplat = @{
  location              = 'westus2'
  TemplateFile          = "$TemplateBasePath\Infrastructure\main.bicep"
  TemplateParameterFile = "$TemplateBasePath\Infrastructure\Environment\$Environment\$Region\main.bicepparam"
}

if ($WhatIf) {
  $ParamSplat.Add('WhatIf', $true)
}

New-AzSubscriptionDeployment @ParamSplat