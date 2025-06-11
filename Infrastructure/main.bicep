@description('The name for the resource group')
param resourceGroupName string

@description('Location for the Resource Group')
param location string

@description('List of Storage account names')
param storageAccountNames array

@description('Name of the Key Vault')
param keyVaultName string

@description('Backup vault name')
param serviceVaultName string

@description('List of tags to assign to resources')
param globalTags object = {}

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}
module storageAccounts './modules/multi-resource/storage/storageWithContainers.bicep' = [for sa in storageAccountNames: {
  name: 'deploy-${sa.name}'
  scope: rg
  params: {
    containerName: sa.container
    storageAccountName: sa.name
    tags: sa.tags
  }
}]

module keyvault './modules/single/keyVault.bicep' = {
  scope: rg
  params: {
    keyVaultName: keyVaultName
    tags: globalTags
  }
}

module recoveryVault './modules/single/serviceRecoveryVault.bicep' = {
  scope: rg
  params: {
    vaultName: serviceVaultName
    location: location
    tags: globalTags
  }
}
