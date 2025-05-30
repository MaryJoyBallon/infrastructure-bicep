using '../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'eastus'
param storageAccountNames = [
  'acctest01'
  'acctest02'
  'acctest03'
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
