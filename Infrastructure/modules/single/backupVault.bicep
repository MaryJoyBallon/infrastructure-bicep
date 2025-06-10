// IaaS VM backup vault
@description('Name of the backup vault')
param backupVaultName string

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Tags to assign to the backup vault')
param tags object = {}

resource backupVault 'Microsoft.DataProtection/backupVaults@2025-01-01' = {
  location: location
  name: 'backupVault-${backupVaultName}'
  properties: {
    featureSettings: {
      crossRegionRestoreSettings: {
        state: 'Enabled'
      }
      crossSubscriptionRestoreSettings: {
        state: 'Enabled'
      }
    }
    monitoringSettings: {
      azureMonitorAlertSettings: {
        alertsForAllJobFailures: 'Enabled'
      }
    }
    replicatedRegions: [
      'west us'
    ]
    securitySettings: {
      softDeleteSettings: {
        retentionDurationInDays: 30
        state: 'enabled'
      }
    }
    storageSettings: [
      {
        datastoreType: 'VaultStore'
        type: 'GeoRedundant'
      }
    ]
  }
  tags: tags
}
