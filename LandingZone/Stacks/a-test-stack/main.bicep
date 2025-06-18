param resourceGroupName string
param location string
param tags object = {}

// Specifies that the deployment target for this Bicep file is at the subscription level.
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: resourceGroupName
  location: location
}


//######################################### Action Group Module
param actionGroupName string
param actionGroupShortName string
param enableActionGroup bool = true
param emailReceivers array = []
param smsReceivers array = []

module actionGroup '../../modules/monitor/action_group/main.bicep' = {
  scope: rg
  params: {
    actionGroupName: actionGroupName
    actionGroupShortName: actionGroupShortName
    enableActionGroup: enableActionGroup
    emailReceivers: emailReceivers
    smsReceivers: smsReceivers
    tags: tags
  }
}

