using '../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'eastus'
param storageAccountNames = [
  'stcstorageaccount01'
  'stcstorageaccount02'
  'stcstorageaccount03'
]
