
param rg_name string
param tags object

targetScope = 'subscription'


resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rg_name
  location: deployment().location
  tags: tags
}
