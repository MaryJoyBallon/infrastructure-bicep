@allowed([
  'GeoRedundant'
  'LocallyRedundant'
])

@description('Name of the recovery vault')
param vaultName string

@description('Location for the recovery vault')
param location string = resourceGroup().location

@description('Name of the resource guard to use for the Recovery Services vault.')
param resourceGuardName string

@description('The storage redundancy type for the Recovery Services vault.')
param vaultStorageType string = 'GeoRedundant'

@description('Enable Cross Region Restore for the Recovery Services vault.')
param enableCRR bool = false

@description('List of tags to assign to the recovery vault')
param tags object = {}

resource resourceGuard 'Microsoft.DataProtection/resourceGuards@2021-07-01' = {
  location: location
  name: resourceGuardName
  properties: {}
  tags: tags
}

resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2022-02-01' = {
  name: vaultName
  location: location
  sku: {
      name: 'Standard'
    }
  properties: {}
}

resource vaultName_vaultstorageconfig 'Microsoft.RecoveryServices/vaults/backupstorageconfig@2022-02-01' = {
  parent: recoveryServicesVault
  name: 'vaultstorageconfig'
  properties: {
    storageModelType: vaultStorageType
    crossRegionRestoreFlag: enableCRR
  }
}
