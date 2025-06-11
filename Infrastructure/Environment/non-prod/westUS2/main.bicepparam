using '../../../main.bicep'

param resourceGroupName = 'rg-mballon'
param location = 'westus2'
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
param keyVaultName = 'stckeyVaulttest01'
param globalTags = {
  environment: 'dev'
  owner: 'mballon'
}
param vnetName = 'hub-vnet'
param addressSpace = '10.0.0.0/16' 
param vnetmngmtName  = 'mgmt-vnet'
param vnetAddressPrefix = '10.0.0.0/16'
param subnetName  = 'mgmt-subnet'
param subnetPrefix  = '10.0.1.0/24'
param nsgName  = 'mgmt-nsg'
