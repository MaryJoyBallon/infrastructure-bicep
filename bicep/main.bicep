@description('The name for the resource group')
param resourceGroupName string

@description('Location for the Resource Group')
param location string

@description('List of Storage account names')
param storageAccountNames array

@description('Name of the Key Vault')
param keyVaultName string

//Deploy resource group at subscription scope
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}

module ipgroup2 './modules/ipGroup.bicep' = {
  scope: rg
  name: 'deploy-ipgroup'
  params: {
    ipAddresses: ['1.1.1.1']
    ipgroupName: 'ipgroup1'
  }
}

module storageAccounts './modules/storageAccount.bicep' = [for sa in storageAccountNames: {
  name: 'deploy-${sa.name}'
  scope: rg
  params: {
    containerName: sa.container
    storageAccountName: sa.name
    tags: sa.tags
  }
}]

module keyvault './modules/keyVault.bicep' = {
  scope: rg
  params: {
    keyVaultName: keyVaultName
  }
}
