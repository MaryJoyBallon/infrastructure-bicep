@description('Name of the action group')
param actionGroupName string

@description('Short name for the action group, used in notifications')
@maxLength(12)
param actionGroupShortName string

/*
emailReceivers: [
  {
    name: 'string'
    emailAddress: 'string'
    useCommonAlertSchema: bool
  }
]
*/
@description('Array of email receivers for the action group')
param emailReceivers array = []

/*
smsReceivers: [
  {
    name: 'string'
    countryCode: 'string'
    phoneNumber: 'string'
  }
]
*/
@description('Array of SMS receivers for the action group')
param smsReceivers array = []

@description('Enable the action group')
param enableActionGroup bool = false

@description('Tags for the action group')
param tags object = {}

//Currently just supports EMAIL/SMS
resource actiongroup 'Microsoft.Insights/actionGroups@2024-10-01-preview'  = {
  name: actionGroupName
  location: 'global'
  tags: tags
  properties: {
    groupShortName: actionGroupShortName
    enabled: enableActionGroup
    emailReceivers: emailReceivers
    smsReceivers: smsReceivers

  }
}
