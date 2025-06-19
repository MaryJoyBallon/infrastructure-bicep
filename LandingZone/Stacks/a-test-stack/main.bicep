param resourceGroupName string
param location string
param tags object = {}

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}

//###################################### recovery services vault
param recoveryServicesVaultName string
param publicNetworkAccessRSV string
param softDeleteFeatureState string
param isSoftDeleteFeatureStateEditable bool = false
param vaultStorageType string = 'GeoRedundant'
param skuName string = 'Standard'
param crossSubscriptionRestoreState string = 'Disabled'
param crossRegionRestore bool = false

module recoveryServicesVault '../LandingZone/modules/recovery_services/recovery_services_vault/main.bicep' = {
  scope: rg
  params: {
    recoveryServicesVaultName: recoveryServicesVaultName
    publicNetworkAccessRSV: publicNetworkAccessRSV
    softDeleteFeatureState: softDeleteFeatureState
    isSoftDeleteFeatureStateEditable: isSoftDeleteFeatureStateEditable
    vaultStorageType: vaultStorageType
    skuName: skuName
    crossSubscriptionRestoreState: crossSubscriptionRestoreState
    crossRegionRestore: crossRegionRestore
    tags: tags
  }
}
