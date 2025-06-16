using './main.bicep'
param rg_name = 'rg-ex-npd-eus2'

param tags = {
  environment: 'nonProd'
  codebase: 'Bicep'
}
