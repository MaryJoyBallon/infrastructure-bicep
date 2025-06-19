//############################################## Global parameters for testing Only #######
using '../../../Stacks/a-test-stack/main.bicep'                      
param resourceGroupName = 'rg-mballon'
param location = 'westus2'
//param tags = {
//  environment: 'nonProd'
//  codebase: 'Bicep'
//}

//######################################### Key Vault Secret Module
// using 'main.bicep'
param keyVaultName = 'test-nonprod-wus2-kv'
param secretName = 'secret2-name'

@secure()
param secretValue = 's3cReTvalueTest()!'
