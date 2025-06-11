@description('Name of the recovery vault')
param vaultName string

@description('Location for the recovery vault')
param location string

@description('List of tags to assign to the recovery vault')
param tags object = {}

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
      '/Providers/Microsoft.RecoveryServices/vaults/delete'
      '/Providers/Microsoft.RecoveryServices/vaults/backupPolicies/delete'
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
