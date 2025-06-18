@description('Object ID of the principal (user, app, or managed identity)')
param objectId string

@description('Tenant ID of the Azure AD tenant')
param tenantId string = subscription().tenantId

@description('Permissions to keys')
param keyPermissions array = []

@description('Permissions to secrets')
param secretPermissions array = []

@description('Permissions to storage')
param storagePermissions array = []

@description('Permissions to certificates')
param certificatePermissions array = []

@description('Name of the Key Vault')
param keyVaultName string

resource keyVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' existing = {
  name: keyVaultName
}

resource keyVaultAC 'Microsoft.KeyVault/vaults/accessPolicies@2024-12-01-preview' = {
  name: 'add'
  parent: keyVault
  properties: {
    accessPolicies: [
      {
        objectId: objectId
        permissions: {
          certificates: certificatePermissions
          keys: keyPermissions
          secrets: secretPermissions
          storage: storagePermissions
        }
        tenantId: tenantId
      }
    ]
  }
}
