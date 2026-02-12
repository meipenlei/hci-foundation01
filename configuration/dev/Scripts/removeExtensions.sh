# Install the Az module
Install-Module -Name Az -AllowClobber -Scope CurrentUser

# Login to Azure
az login

# List all subscriptions
az account list --output table

# Import the Az module
Import-Module Az

# Connect to Azure using device authentication
Connect-AzAccount -UseDeviceAuthentication

# Get the subscription you want to set as the context
$subscription = Get-AzSubscription --SubscriptionId "f371e124-4b06-46ea-9d63-f51d48d76e64"

# Set the context
Set-AzContext -Subscription $subscription

# Get all subscriptions
$subscriptions = Get-AzSubscription

# Loop through each subscription
foreach ($subscription in $subscriptions) {
    # Set the context to the current subscription
    Set-AzContext -Subscription $subscription

    # Get all VMs in the current subscription
    $vms = Get-AzVM

    # Loop through each VM
    foreach ($vm in $vms) {
        # Get all extensions for the current VM
        $extensions = Get-AzVMExtension -VMName $vm.Name -ResourceGroupName $vm.ResourceGroupName

        # Check if MicrosoftMonitoringAgent is in the list of extensions
        if ($extensions.Name -contains "MicrosoftMonitoringAgent") {
            # Print the VM
            $vm | Format-Table
        }

        foreach ($extension in $extensions) {
            if ($extension.Name -eq "MicrosoftMonitoringAgent") {
                # Remove the extension
                Remove-AzVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -Name $extension.Name -Force
            }
        }
    }
}