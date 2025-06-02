using '../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'eastus'
param storageAccountNames = [
  'stcstorageaccount01'
  'stcstorageaccount02'
  'stcstorageaccount03'
]

// Use this when you 
/*
param storageAccounts = [
  {
    storageAccountName: 'acctest01'
    containerName: 'logs'
  }
  {
    storageAccountName: 'acctest02'
    containerName: 'metrics'
  }
  {
    storageAccountName: 'acctest03'
    containerName: 'default'
  }
]
*/
