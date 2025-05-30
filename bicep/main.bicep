//Parameters
param resourceGroupName string
param location string = 'East US'
param storageAccountName string = 'mystorageacctest01'

//Deploy resource group at subscription scope
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}

module ipgroup2 './modules/ipgroup.bicep' = {
  scope: rg
  name: 'ipgroupDEPLOYMENT'
  params: {
    ipAddresses: ['1.1.1.1']
    ipgroupName: 'ipgroup1'
  }
}

module storageAccount './modules/storage-account.bicep' = {
  scope: rg
  params: {
    storageAccountName: storageAccountName
  }
}
