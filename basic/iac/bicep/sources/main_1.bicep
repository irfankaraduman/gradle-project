@secure()
param adminPassword string = 'adminpass'

resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: 'myVM'
  location: 'eastus'
  properties: {
    osProfile: {
      adminUsername: 'adminuser'
      adminPassword: adminPassword
    }
  }
}
