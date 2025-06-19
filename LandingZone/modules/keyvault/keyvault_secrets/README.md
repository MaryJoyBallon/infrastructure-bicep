# Introduction 
# 🔐 Key Vault Secret Deployment (Bicep)

This Bicep module creates a secret in an existing Azure Key Vault.

## 📦 Module Overview

This module:
- Accepts the name of an existing Key Vault
- Creates a new secret with the provided name and value
- Outputs the full resource ID of the created secret

## 📦 Parameters

| Name          | Type    | Description                                           |
|---------------|---------|-------------------------------------------------------|
| `keyVaultName`| string  | Name of the existing Key Vault                        |
| `secretName`  | string  | Name of the secret to be created                      |
| `secretValue` | string  | Value of the secret (marked as secure in Bicep)       |

## 🔐 Security Note

The `secretValue` parameter is marked with `@secure()` to prevent logging the secret during deployments. Ensure the value is passed securely (e.g., via Azure DevOps secret variables or `az deployment` CLI).

## 🚀 Example Usage (CLI)

Manual deployment of key vault secret to avoid committing the secret value using git bash.

```bash
# Using variables and values for parameters
az deployment group create \
  --resource-group rg-ex-npd-eus2 \
  --template-file ./main.bicep \
  --parameters keyVaultName='test-nonprod-wus2-kv' \
               secretName='secret-name' \
               secretValue='s3cReTvalueTest()!'

# Using bicepparam file
az deployment group create \
  --resource-group rg-ex-npd-eus2 \
  --template-file ./main.bicep \
  --parameters example.bicepparam

# Using bicepparam file + Inline Override
az deployment group create \
  --resource-group rg-mballon \
  --template-file ./main.bicep \
  --parameters example.bicepparam \
  --parameters secretValue='test_secret_value'
```
