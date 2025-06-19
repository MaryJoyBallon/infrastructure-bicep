@allowed([
  'GeoRedundant'
  'LocallyRedundant'
  'ZoneRedundant'
])
@description('The storage redundancy type for the Recovery Services vault.')
param vaultStorageType string

@allowed([
  'RS0'
  'Standard'
])
@description('The SKU for the Recovery Services vault.')
param skuName string

@description('Cross subscription restore state for the Recovery Services vault.')
param crossSubscriptionRestoreState string

@description('Indicates whether cross subscription restore is enabled for the Recovery Services vault.')
param crossRegionRestore bool

@description('Location for the recovery vault')
param location string = resourceGroup().location

@description('Name of the recovery vault')
param recoveryServicesVaultName string

@description('Public network access setting for the Recovery Services vault.')
param publicNetworkAccessRSV string

@description('Enable soft delete feature for the Recovery Services vault.')
param softDeleteFeatureState string

@description('Indicates whether the soft delete feature state is editable for the Recovery Services vault.')
param isSoftDeleteFeatureStateEditable bool = false

@description('List of tags to assign to the recovery vault')
param tags object = {}

resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2023-06-01' = {
  name: recoveryServicesVaultName
  location: location
  sku: {
      name: skuName
    }
  properties: {
    publicNetworkAccess: publicNetworkAccessRSV
    restoreSettings: {
      crossSubscriptionRestoreSettings: {
        crossSubscriptionRestoreState: crossSubscriptionRestoreState
      }
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
  tags: tags
}

resource backupConfig 'Microsoft.RecoveryServices/vaults/backupconfig@2023-04-01' = {
  name: 'vaultconfig'
  parent: recoveryServicesVault
  properties: {
    softDeleteFeatureState: softDeleteFeatureState
    isSoftDeleteFeatureStateEditable: isSoftDeleteFeatureStateEditable
    storageModelType: vaultStorageType
    storageType: vaultStorageType
  }
  tags: tags
}

resource vaultstorageconfig 'Microsoft.RecoveryServices/vaults/backupstorageconfig@2023-04-01' = {
  parent: recoveryServicesVault
  name: 'vaultstorageconfig'
  properties: {
    crossRegionRestoreFlag: crossRegionRestore
    storageModelType: vaultStorageType
    storageType: vaultStorageType
  }
  tags: tags
}
