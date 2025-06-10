// RBAC
/*
@description('Object ID of user, group, or managed identity)')
param groupObjectId string

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
