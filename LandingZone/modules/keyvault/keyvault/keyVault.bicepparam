using '../../../.pipeline/main.bicep'

param resourceGroupName = 'rg-mballon'
param azRegion = 'westus2'
param keyVaultName = 'stckeyVaulttest01'
param globalTags = {
  environment: 'dev'
  owner: 'mballon'
}
