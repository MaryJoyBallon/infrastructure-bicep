// Please update

//Azure Monitor
// Log Analytics workspace + diagnostics + action group
/*
Create Log Analytics workspace
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  ...
}

// Diagnostic settings to send logs to workspace
resource diagSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  ...
}

// Action group for alerts
resource actionGroup 'Microsoft.Insights/actionGroups@2022-06-01' = {
  ...
}
*/ 
@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the Log Analytics Workspace')
param workspaceName string
/*
@description('Tags to assign to the Log Analytics Workspace')
param tags object = {}
*/
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2025-02-01' = {
  name: workspaceName
  location: location
  properties: {
    sku: {
      name: 'standard'
    }
    retentionInDays: 30
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}
