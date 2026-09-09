@secure()
param adminPassword string

resource virtualMachine 'Microsoft.ComputeMachines/virtualMachines@2021-03-01' = {
  name: 'myVM'
  location: 'eastus'
  properties: {
    osProfile: {
      adminUsername: 'adminuser'
      adminPassword: adminPassword
    }
  }
}

output adminPasswordOut string = virtualMachine.properties.osProfile.adminPassword
