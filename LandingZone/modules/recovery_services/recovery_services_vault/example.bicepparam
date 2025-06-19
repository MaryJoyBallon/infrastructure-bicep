using 'main.bicep'

param vaultStorageType = 'GeoRedundant'
param skuName = 'RS0'
param crossRegionRestore = true
param crossSubscriptionRestoreState = 'Enabled'
param location = 'westus2'
param recoveryServicesVaultName = 'sample-nonprod-wus2-rsv'
param publicNetworkAccessRSV = 'Disabled'
param softDeleteFeatureState = 'Enabled'
param isSoftDeleteFeatureStateEditable = true
param tags = {
  environment: 'nonProd'
  codebase: 'Bicep'
}
