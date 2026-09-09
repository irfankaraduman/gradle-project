param name_param string = ''
param location string = ''

resource name 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = {
  name: name_param
  location: location
  properties: {
    encryption: {
      keySource: 'Microsoft.Keyvault'
    }
  }
}
