//############################################## Global parameters for testing Only #######  TO BE DELETED
using '../../../Stacks/a-test-stack/main.bicep'                      
param resourceGroupName = 'rg-mballon'
param location = 'westus2'
param tags = {
  environment: 'nonProd'
  codebase: 'Bicep'
}


//######################################### Action Group Moduleparameters
//using 'main.bicep'
param actionGroupName = 'test-nonprod-wus2-ag'
param actionGroupShortName = 'NonProdAG'
param enableActionGroup = true
param emailReceivers = [
  {
    name: 'email-ops'
    emailAddress: 'firstname.lastname@gmail.com'
    useCommonAlertSchema: true
  }
]

param smsReceivers = [
  {
    name: 'sms-ops'
    countryCode: '1'
    phoneNumber: '9305338367'
  }
]
