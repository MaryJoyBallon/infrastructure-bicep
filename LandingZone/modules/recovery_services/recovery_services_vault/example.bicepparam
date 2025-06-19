using '../../../Stacks/a-test-stack/main.bicep'                      
param resourceGroupName = 'rg-mballon'
param location = 'westus2'
param tags = {
  environment: 'nonProd'
  codebase: 'Bicep'
}
//using 'main.bicep'

param vaultStorageType = 'GeoRedundant'
param skuName = 'RS0'
param crossRegionRestore = true
param crossSubscriptionRestoreState = 'Enabled'
param recoveryServicesVaultName = 'sample-nonprod-wus2-rsv'
param publicNetworkAccessRSV = 'Disabled'
param softDeleteFeatureState = 'Enabled'
param isSoftDeleteFeatureStateEditable = true
