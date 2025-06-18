//############################################## Global parameters for testing Only #######  TO BE DELETED
using '../../../Stacks/a-test-stack/main.bicep'                      
param resourceGroupName = 'rg-mballon'
param location = 'westus2'
param tags = {
  environment: 'nonProd'
  codebase: 'Bicep'
}

//######################################### Key Vault Module parameters
//using 'main.bicep'
param keyVaultName = 'test-nonprod-wus2-kv'
param publicNetworkAccess = 'Disabled'
param sku = 'standard'
param enabledForDiskEncryption = false
param enablePurgeProtection = true
param enableRbacAuthorization = false
param enableSoftDelete = true
