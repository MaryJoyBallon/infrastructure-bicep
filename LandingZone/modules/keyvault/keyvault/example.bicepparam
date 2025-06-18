//############################################## Global parameters for testing Only #######
using '../../../Stacks/test-stack/main.bicep'                      
param resourceGroupName = 'rg-mballon'
param location = 'westus2'
param globalTags = {
  environment: 'nonProd'
  owner: 'devops-pipeline'
}

//######################################### Key Vault Module parameters
//using 'main.bicep'
param keyVaultName = 'stckeyVaulttest01'
param publicNetworkAccess = 'Disabled'
param sku = 'standard'
param enabledForDiskEncryption = false
param enablePurgeProtection = true
param enableRbacAuthorization = false
param enableSoftDelete = true
