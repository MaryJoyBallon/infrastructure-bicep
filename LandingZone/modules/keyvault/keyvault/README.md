# Introduction 
# Azure Key Vault Bicep Module

This Bicep module deploys an Azure Key Vault with configurable options, excluding access policies. It is intended for use cases where:
- Access is managed using **RBAC**, or
- Access policies are configured **externally** (e.g., in a separate Bicep module)

---

## 📦 Module Parameters

| Name                       | Type     | Description |
|----------------------------|----------|-------------|
| `keyVaultName`             | `string` | Name of the Key Vault. Must be globally unique. |
| `azRegion`                 | `string` | Azure region where the Key Vault will be deployed. Defaults to resource group location. |
| `publicNetworkAccess`      | `string` | `Enabled` or `Disabled`. Controls public access. |
| `sku`                      | `string` | Key Vault SKU. Allowed: `standard`, `premium`. |
| `enabledForDiskEncryption` | `bool`   | Enables disk encryption support. |
| `enableSoftDelete`         | `bool`   | Enables soft delete (required for purge protection). |
| `enablePurgeProtection`    | `bool`   | Enables purge protection. |
| `enableRbacAuthorization`  | `bool`   | Enables Azure RBAC instead of access policies. |
| `tenantID`                 | `string` | Azure AD tenant ID. Defaults to current subscription tenant. |
| `tags`                     | `object` | Optional tags to assign to the Key Vault. |


Using Keyvault
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/scenarios-secrets

Notes:

- **enableSoftDelete** - Enabling the 'soft delete' functionality is an irreversible action. Once set to `true`, this property cannot be reverted to `false`.

- **enablePurgeProtection** - Enabling the 'purge protection' for a vault is an irreversible action. Once set to `true`, this property cannot be reverted to `false`.