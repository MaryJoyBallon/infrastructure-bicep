using '../../../.pipeline/main.bicep'

param resourceGroupName = 'rg-mballon'
param azRegion = 'westus2'
param keyVaultName = 'stckeyVaulttest01'
param globalTags = {
  environment: 'dev'
  owner: 'mballon'
}

param publicNetworkAccess = 'Enabled'
param sku = 'standard'
param enabledForDiskEncryption = true
param enablePurgeProtection = true
param enableRbacAuthorization = true
param enableSoftDelete = true
