using '../../../.pipeline/main.bicep'

param resourceGroupName = 'rg-mballon'
param azRegion = 'westus2'
param keyVaultName = 'stckeyVaulttest01'
param globalTags = {
  environment: 'dev'
  owner: 'mballon'
}

param publicNetworkAccess = 'Disabled'
param sku = 'premium'
param enabledForDiskEncryption = false
param enablePurgeProtection = false
param enableRbacAuthorization = false
param enableSoftDelete = true
