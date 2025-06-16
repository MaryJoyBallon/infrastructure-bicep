
resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2021-07-01' = {
  name: backupPolicyName
  parent: recoveryServicesVault
  properties: {
    backupManagementType: 'AzureIaasVM'
    timeZone: 'Pacific Standard Time'
    instantRPDetails: {
      azureBackupRGNamePrefix: 'AzureBackupRG'
      azureBackupRGNameSuffix: '01'
    }
    instantRpRetentionRangeInDays: 7
    schedulePolicy: {
      schedulePolicyType: 'SimpleSchedulePolicy'
      scheduleRunFrequency: 'Daily'
      scheduleRunTimes: [
        '2024-01-01T13:00:00Z' // 6 AM Pacific in UTC
      ]
    }
    retentionPolicy: {
      retentionPolicyType: 'SimpleRetentionPolicy'
      dailySchedule: {
        retentionTimes: [
          '2024-01-01T13:00:00Z'
        ]
        retentionDuration: {
          count: 30
          durationType: 'Days'
        }
      }
    }
    tieringPolicy: {
      snapshotTiering: {
        duration: 10
        durationType: 'Days'
        tieringMode: 'TierAfterDuration'
      }
    }
  }
}
