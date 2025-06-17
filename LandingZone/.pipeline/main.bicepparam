using 'main.bicep'

param resourceGroupName = 'rg-mballon'
param azRegion = 'westus2'
param globalTags = {
  environment: 'dev'
  owner: 'mballon'
}

/*
//######################################### Key Vault Module parameters
param keyVaultName = 'stckeyVaulttest01'
param publicNetworkAccess = 'Disabled'
param sku = 'standard'
param enabledForDiskEncryption = false
param enablePurgeProtection = true
param enableRbacAuthorization = false
param enableSoftDelete = true

//######################################### Key Vault Access Policy Module parameters
param objectId = '1896c40b-7d2b-443e-acad-b60d96876b6d' // Replace with actual Object ID
param keyPermissions = [
  'all'
  'backup'
  'create'
  'decrypt'
  'delete'
  'encrypt'
  'get'
  'getrotationpolicy'
  'import'
  'list'
  'purge'
  'recover'
  'release'
  'restore'
  'rotate'
  'setrotationpolicy'
  'sign'
  'unwrapKey'
  'update'
  'verify'
  'wrapKey'
]
param secretPermissions = [
  'all'
  'backup'
  'delete'
  'get'
  'list'
  'purge'
  'recover'
  'restore'
  'set'
]

param certificatePermissions = [
  'all'
  'backup'
  'create'
  'delete'
  'deleteissuers'
  'get'
  'getissuers'
  'import'
  'list'
  'listissuers'
  'managecontacts'
  'manageissuers'
  'purge'
  'recover'
  'restore'
  'setissuers'
  'update'
]

param storagePermissions = [
  'all'
  'backup'
  'delete'
  'deletesas'
  'get'
  'getsas'
  'list'
  'listsas'
  'purge'
  'recover'
  'regeneratekey'
  'restore'
  'set'
  'setsas'
  'update'
]
  */

//######################################### Action Group Moduleparameters
param actionGroupName = 'stcActionGroup'
param actionGroupShortName = 'stcAG'
param enableActionGroup = true
param emailReceivers = [
  {
    name: 'mballon-email-ops'
    emailAddress: 'maryjoy.ballon@3cloudsolutions.com'
    useCommonAlertSchema: true
  }
]

param smsReceivers = [
  {
    name: 'mballon-sms-ops'
    countryCode: '1'
    phoneNumber: '9305308364'
  }
]
