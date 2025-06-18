param resourceGroupName string
param location string

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}


//######################################### Key Vault Access Policy Module
param keyVaultName string
param objectId string
param keyPermissions array = []
param secretPermissions array = []
param storagePermissions array = []
param certificatePermissions array = []
module keyvaultAP '../../modules/keyvault/keyvault_access_policy/main.bicep' = {
  scope: rg
  params: {
    keyVaultName: keyVaultName
    objectId: objectId
    keyPermissions: keyPermissions
    secretPermissions: secretPermissions
    storagePermissions: storagePermissions
    certificatePermissions: certificatePermissions
  }
}

