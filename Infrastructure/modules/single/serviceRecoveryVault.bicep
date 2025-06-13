@description('Name of the recovery vault')
param vaultName string

@description('Location for the recovery vault')
param location string = resourceGroup().location

@description('List of tags to assign to the recovery vault')
param tags object = {}

param resourceGuardName string

resource resourceGuard 'Microsoft.DataProtection/resourceGuards@2021-07-01' = {
  location: location
  name: resourceGuardName
  properties: {}
  tags: tags
}

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2025-02-01' = {
  name: vaultName
  location: location
  tags: tags
  sku: {
      name: 'Standard'
    }
  properties: {
    publicNetworkAccess: 'Disabled'
    redundancySettings: {
      crossRegionRestore: 'Enabled'
      standardTierStorageRedundancy: 'GeoRedundant'
    }
    resourceGuardOperationRequests: [
      resourceGuard.id
    ]
    restoreSettings: {
      crossSubscriptionRestoreSettings: {
        crossSubscriptionRestoreState: 'Enabled'
      }
    }
    securitySettings: {
      immutabilitySettings: {
        state: 'Enabled'
      }
      softDeleteSettings: {
        enhancedSecurityState: 'Enabled'
        softDeleteRetentionPeriodInDays: 30
        softDeleteState: 'Enabled'
      }
    }
  }
}
