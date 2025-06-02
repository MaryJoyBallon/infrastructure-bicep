using '../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'eastus'
param storageAccountNames = [
  {
    name: 'stcstorageaccount01'
    container: 'logs'
    tags: {
      environment: 'prod'
    }
  }
  {
    name: 'stcstorageaccount02'
    container: 'metrics'
    tags: {
      environment: 'prod'
    }
  }
  {
    name: 'stcstorageaccount03'
    container: 'default'
    tags: {
      environment: 'prod'
    }
  }
]
