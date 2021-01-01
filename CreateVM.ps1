#Connects to Azure

Connect-AzAccount

#Lists your Subscriptions associated with your account

#ACTION - Copy the subscription you would like to access as you will need it

get-azsubscription

#Select the relevent subscription you want to create the resources inside of

#ACTION - Paste the subscripn below where it says XXX

Select-AzSubscription -SubscriptionId XXX

#Creates New Resource Group called PsVmResourceGroup in UKSouth

New-AzResourceGroup -Name PsVmResourceGroup -Location UKSouth

#Creates server called myPSTestVM, places it inside of PsVmResourceGroup Resource Group and opens ports 80 and 3389

New-AzVm `
    -ResourceGroupName "PsVmResourceGroup" `
    -Name "myPSTestVM" `
    -Location "UKSouth" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389

#Gets IP Address of Server

Get-AzPublicIpAddress -ResourceGroupName "PsVmResourceGroup" | Select "IpAddress"