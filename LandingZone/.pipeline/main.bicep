param resourceGroupName string
param location string
param globalTags object = {}

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}


//######################################### Key Vault Module
param keyVaultName string
param publicNetworkAccess string
param sku string
param enabledForDiskEncryption bool
param enablePurgeProtection bool
param enableRbacAuthorization bool
param enableSoftDelete bool
module keyvault '../modules/keyvault/keyvault/keyVault.bicep' = {
  scope: rg
  params: {
    location: location
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

/*
//######################################### Key Vault Access Policy Module
param objectId string
param keyPermissions array = []
param secretPermissions array = []
param storagePermissions array = []
param certificatePermissions array = []
module keyvaultAP '../modules/keyvault/keyvault_access_policy/keyVaultAccessPolicy.bicep' = {
  scope: rg
  params: {
    keyVaultName: keyVaultName
    objectId: objectId
    keyPermissions: keyPermissions
    secretPermissions: secretPermissions
    storagePermissions: storagePermissions
    certificatePermissions: certificatePermissions
  }
  dependsOn: [
    keyvault
  ]
}
*/

//######################################### RBAC Role Assignment Module
// SKIPPED for now
/*
param roleDefinitionId string

param principalId string
param roleAssignmentName string

module rbacRoleAssignment '../modules/rbac/role_assignment/rbaccustomroleMG.bicep' = {
  scope: rg
  params: {
    roleDefinitionId: roleDefinitionId
    principalId: principalId
    roleAssignmentName: roleAssignmentName
    scope: keyvault.id
  }
}
*/

//######################################### Action Group Module
param actionGroupName string
param actionGroupShortName string
param enableActionGroup bool = true
param emailReceivers array = []
param smsReceivers array = []

module actionGroup '../modules/monitor/action_group/actionGroup.bicep' = {
  scope: rg
  params: {
    actionGroupName: actionGroupName
    actionGroupShortName: actionGroupShortName
    enableActionGroup: enableActionGroup
    emailReceivers: emailReceivers
    smsReceivers: smsReceivers
    tags: globalTags
  }
}
/**/
