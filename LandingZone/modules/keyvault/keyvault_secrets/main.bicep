@description('Name of the Key Vault')
param keyVaultName string

@description('Name of the secret to create in the Key Vault')
param secretName string

@secure()
param secretValue string

resource keyVault 'Microsoft.KeyVault/vaults@2024-12-01-preview' existing = {
  name: keyVaultName
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = {
  name: secretName
  parent: keyVault
  properties: {
    value: secretValue
  }
}

output id string = secret.id
