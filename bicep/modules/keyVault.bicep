@description('Location')
param location string = resourceGroup().location

@description('Name of the Key Vault')
param keyVaultName string

@description('Principal ID to assign RBAC (user, service principal, or managed identity)')
//param principalId string

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
    publicNetworkAccess: 'Enabled'
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
}

/*
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, principalId, 'KeyVaultSecretsUser')
  scope: keyVault
  properties: {
    principalId: principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6') // Key Vault Secrets User
    principalType: 'ServicePrincipal'
  }
}
*/
