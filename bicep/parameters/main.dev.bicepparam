using '../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'eastus'
param storageAccountNames = [
  {
    name: 'stcstorageaccount01'
    container: 'logs'
    tags: {
      environment: 'dev'
    }
  }
  {
    name: 'stcstorageaccount02'
    container: 'metrics'
    tags: {
      environment: 'dev'
    }
  }
  {
    name: 'stcstorageaccount03'
    container: 'default'
    tags: {
      environment: 'dev'
    }
  }
]
param keyVaultName = 'stckeyVaulttest'
