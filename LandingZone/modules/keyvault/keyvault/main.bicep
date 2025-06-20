@description('Public network access for the Key Vault.')
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
param location string = resourceGroup().location

@description('Enable disk encryption for the Key Vault.')
param enabledForDiskEncryption bool = false

@description('Enable purge protection for the Key Vault.')
param enablePurgeProtection bool = false

@description('Enable RBAC authorization for the Key Vault.')
param enableRbacAuthorization bool = false

@description('Enable soft delete for the Key Vault.')
param enableSoftDelete bool = false

@description('Name of the Key Vault')
param keyVaultName string

@description('A set of tags to assign to the Key Vault resource.')
param tags object = {}

@description('Tenant ID for the Key Vault. Defaults to the current subscription tenant ID.')
param tenantID string = subscription().tenantId

resource KeyVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: keyVaultName
  location: location
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

