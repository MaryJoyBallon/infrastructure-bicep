using '../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'eastus'
param storageAccountNames = [
  'acctest01'
  'acctest02'
  'acctest03'
]

