param resourceGroupName string
param azRegion string
param keyVaultName string
param globalTags object = {}

param publicNetworkAccess string
param sku string
param enabledForDiskEncryption bool
param enablePurgeProtection bool
param enableRbacAuthorization bool
param enableSoftDelete bool

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: azRegion
}

module keyvault '../modules/keyvault/keyvault/keyVault.bicep' = {
  scope: rg
  params: {
    azRegion: azRegion
    enabledForDiskEncryption: enabledForDiskEncryption
    enablePurgeProtection: enablePurgeProtection
    enableRbacAuthorization: enableRbacAuthorization
    enableSoftDelete: enableSoftDelete
    keyVaultName: keyVaultName
    tags: globalTags
    publicNetworkAccess: publicNetworkAccess
    sku: sku
  }
}


//######################################### Key Vault Access Policy Module
param objectId string
param keyPermissions array = []
param secretPermissions array = []
param storagePermissions array = []
param certificatePermissions array = []
param keyvaultAccessPolicy string
module keyvaultAP '../modules/keyvault/keyvault_access_policy/keyVaultAccessPolicy.bicep' = {
  scope: rg
  params: {
    keyVaultName: keyVaultName
    keyvaultAccessPolicy: keyvaultAccessPolicy
    objectId: objectId
    keyPermissions: keyPermissions
    secretPermissions: secretPermissions
    storagePermissions: storagePermissions
    certificatePermissions: certificatePermissions
  }
}
