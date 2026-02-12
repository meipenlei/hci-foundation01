# Import the Az module
Import-Module Az

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

        # Check if IaaSDiagnostics and LogAnalytics extensions are installed
        if ($extensions.Name -contains "DependencyAgentWindows") {
            # Print the VM and a message indicating that VM insights are enabled
            $vm | Format-Table
            Write-Output "VM insights are enabled for VM: $($vm.Name)"
        }
    }
}