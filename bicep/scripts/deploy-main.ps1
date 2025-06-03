[CmdletBinding()]
param (
  [Parameter()]
  [switch] $WhatIf,

  [Parameter()]
  [ValidateSet('dev', 'prod')]
  [string] $Environment,
  [string] $TemplateBasePath
)

$ParamSplat = @{
  location              = 'eastus'
  TemplateFile          = "$TemplateBasePath\bicep\main.bicep"
  TemplateParameterFile = "$TemplateBasePath\bicep\parameters\main.$Environment.bicepparam"
}

if ($WhatIf) {
  $ParamSplat.Add('WhatIf', $true)
}

New-AzSubscriptionDeployment @ParamSplat