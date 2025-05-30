targetScope = 'resourceGroup'

param location string = resourceGroup().location
param ipgroupName string
param ipAddresses string[]

resource ipgroup 'Microsoft.Network/ipGroups@2024-01-01' = {
  name: ipgroupName
   location: location
  properties: {
    ipAddresses: ipAddresses
  }
}
