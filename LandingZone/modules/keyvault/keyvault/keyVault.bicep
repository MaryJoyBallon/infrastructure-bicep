@description('Public network access for the Key Vault. Allowed values: "Enabled", "Disabled".')
@allowed([
  'Enabled'
  'Disabled'
])
param publicNetworkAccess string

@allowed([
  'premium'
  'standard'
])
param sku string

@description('Azure region for the Key Vault.')
param azRegion string

@description('Enable disk encryption for the Key Vault.')
param enabledForDiskEncryption bool

@description('Enable purge protection for the Key Vault.')
param enablePurgeProtection bool

@description('Enable RBAC authorization for the Key Vault.')
param enableRbacAuthorization bool

@description('Enable soft delete for the Key Vault.')
param enableSoftDelete bool

@description('Name of the Key Vault')
param keyVaultName string

@description('A set of tags to assign to the Key Vault resource.')
param tags object = {}

@description('Tenant ID for the Key Vault. Defaults to the current subscription tenant ID.')
param tenantID string = subscription().tenantId

resource KeyVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: keyVaultName
  location: azRegion
  tags: tags
  properties: {
    tenantId: tenantID
    enableRbacAuthorization: enableRbacAuthorization
    publicNetworkAccess: publicNetworkAccess
    enabledForDiskEncryption: enabledForDiskEncryption
    enableSoftDelete: enableSoftDelete
    enablePurgeProtection: enablePurgeProtection
    sku: {
       family: 'A'
      name: sku
    }
    accessPolicies: []
  }
}

