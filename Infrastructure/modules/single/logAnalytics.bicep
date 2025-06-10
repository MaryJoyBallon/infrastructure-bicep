// To be determine if we need to include this in composite/monitoring/monitorCore.bicep

// This module creates a Log Analytics Workspace in Azure.

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
