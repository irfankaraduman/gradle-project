metadata TestDescription = 'Constant propagation - default param string value assigned to var - @allowed'

@allowed([
  'test'
  '1_0'
  'AllAllowed'
])
param version string

var taint = 'TLS${version}'

resource storage 'Microsoft.Storage/storageAccounts@2020-08-01-preview'={
  name:'qwert'
  location: 'southcentralus'
  kind:'StorageV2'
  sku:{
    name:'Standard_LRS'
  }
  properties:{
    accessTier:'Hot'
    supportsHttpsTrafficOnly:true
    isHnsEnabled:true
    minimumTlsVersion: taint
  }
}
