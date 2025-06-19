param resourceGroupName string
param location string
//param tags object = {}

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}

//######################################### Key Vault Secrets Module
param keyVaultName string
param secretName string

@secure()
param secretValue string
module keyvaultSecrets '../../modules/keyvault/keyvault_secrets/main.bicep' = {
  scope: rg
  params: {
    keyVaultName: keyVaultName
    secretName: secretName
    secretValue: secretValue
  }
}
