# Introduction 

# Azure Recovery Services Vault Bicep Module

This Bicep module provisions an **Azure Recovery Services Vault** with optional configuration for:
- **Storage redundancy**
- **Soft delete**
- **Cross-Region Restore (CRR)**
- **Public network access**
- **System-assigned managed identity**

It also defines supporting resources:
- `backupconfig` — manages soft delete and storage type
- `backupstorageconfig` — manages cross-region restore and storage settings

---

## 📦 Parameters

| Name                           | Type      | Description |
|--------------------------------|-----------|-------------|
| `recoveryServicesVaultName`    | `string`  | Name of the Recovery Services Vault. |
| `location`                     | `string`  | Location to deploy the vault. Defaults to resource group location. |
| `skuName`                      | `string`  | SKU for the vault. Allowed values: `RS0`, `Standard`. |
| `vaultStorageType`             | `string`  | Storage redundancy. Allowed: `GeoRedundant`, `LocallyRedundant`, `ZoneRedundant`. |
| `enableCRR`                    | `bool`    | Enables Cross-Region Restore. Default: `false`. |
| `softDeleteFeatureState`       | `string`  | State of the soft delete feature. E.g., `Enabled`, `Disabled`. |
| `isSoftDeleteFeatureStateEditable` | `bool` | Whether soft delete feature can be changed. Default: `false`. |
| `publicNetworkAccessRSV`       | `string`  | Controls public network access. E.g., `Enabled`, `Disabled`. |
| `tags`                         | `object`  | Tags to assign to all deployed resources. |

---