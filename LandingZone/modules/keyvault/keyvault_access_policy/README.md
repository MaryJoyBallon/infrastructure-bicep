# Introduction 
# Azure Key Vault Access Policy Bicep Module

This Bicep module assigns an **access policy** to an existing Azure Key Vault. It supports granting permissions for keys, secrets, certificates, and storage to a user, app, or managed identity using the **Access Policies model** (not RBAC).

> ✅ Use this module only when `enableRbacAuthorization` is set to `false` on the target Key Vault.

---

## 📦 Parameters

| Name                    | Type     | Description |
|-------------------------|----------|-------------|
| `keyVaultName`          | `string` | Name of the existing Key Vault. |
| `objectId`              | `string` | Object ID of the principal (user, service principal, or managed identity). |
| `tenantId`              | `string` | Tenant ID of the Azure AD instance. Defaults to current subscription's tenant ID. |
| `keyPermissions`        | `array`  | List of key permissions (e.g., `get`, `create`, `list`). |
| `secretPermissions`     | `array`  | List of secret permissions (e.g., `get`, `set`, `list`). |
| `certificatePermissions`| `array`  | List of certificate permissions. |
| `storagePermissions`    | `array`  | List of storage permissions. |

---

### ℹ️ About `subscription().tenantId`

The `subscription().tenantId` expression in Bicep returns the unique identifier (GUID) of the Azure Active Directory (AAD) tenant associated with the current subscription. This value is commonly used when configuring resources that require tenant-level information, such as Azure Key Vault. By default, the module uses `subscription().tenantId` for the `tenantID` parameter, ensuring the Key Vault is linked to the correct AAD tenant for your deployment context.