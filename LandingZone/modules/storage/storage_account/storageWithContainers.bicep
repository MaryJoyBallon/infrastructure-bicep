// To separate the storage account and containers

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Azure storage container name')
param storageAccountName string

@description('A set of tags to assign to the storage account resource.')
param tags object = {}

resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  tags: tags
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_0'
    allowBlobPublicAccess: false
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot'
  }
}
