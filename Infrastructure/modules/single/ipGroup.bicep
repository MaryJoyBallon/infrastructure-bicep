@description('Location for all resources.')
param location string = resourceGroup().location

@description('IP group name')
param ipgroupName string

@description('IP addresses to include in the IP group')
param ipAddresses string[]

resource ipgroup 'Microsoft.Network/ipGroups@2024-01-01' = {
  name: ipgroupName
   location: location
  properties: {
    ipAddresses: ipAddresses
  }
}
