@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the Key Vault')
param keyVaultName string

@description('A set of tags to assign to the Key Vault resource.')
param tags object = {}

resource keyVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    publicNetworkAccess: 'Disabled'
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
  tags: tags
}

