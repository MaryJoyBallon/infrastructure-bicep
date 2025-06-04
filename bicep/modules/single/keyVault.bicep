@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the Key Vault')
param keyVaultName string
/*
@description('Object ID of user, group, or managed identity)')
param groupObjectId string

@description('A set of tags to assign to the Key Vault resource.')
param tags object = {}
*/
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
resource kvSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, groupObjectId, 'KeyVaultSecretsUser')
  scope: keyVault
  properties: {
    principalId: groupObjectId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6') // Key Vault Secrets User
    principalType: 'ServicePrincipal'
  }
}
*/
