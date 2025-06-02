//Parameters
param resourceGroupName string
param location string
param storageAccountNames array

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
