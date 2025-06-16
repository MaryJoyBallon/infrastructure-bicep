@description('The name for the resource group')
param resourceGroupName string

@description('Location for the Resource Group')
param azRegion string

@description('Name of the Key Vault')
param keyVaultName string

@description('List of tags to assign to resources')
param globalTags object = {}

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: azRegion
}

module keyvault '../modules/keyvault/keyvault/keyVault.bicep' = {
  scope: rg
  params: {
    azRegion: azRegion
    enabledForDiskEncryption: true
    enablePurgeProtection: true
    enableRbacAuthorization: true
    enableSoftDelete: true
    keyVaultName: keyVaultName
    tags: globalTags
    publicNetworkAccess: 'Enabled'
    sku: 'premium'
  }
}
