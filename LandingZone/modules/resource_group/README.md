# Module Resource Group 

https://learn.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups?pivots=deployment-language-bicep


When deploying, location is defined in the command 
New-AzSubscriptionDeployment -Location <location> -TemplateFile <path-to-bicep>

deployment().location uses the location identified in the command for the RG Location
