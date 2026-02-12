# Virtual machines
virtual_machines = {
  vm1 = {
    resource_group_key = "rg1"
    provision_vm_agent = true
    # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
    # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
    # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage
    boot_diagnostics_storage_account_key = ""
    os_type                              = "windows"

    # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
    keyvault_key = "kv1"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        name                    = "dc2"
        enable_ip_forwarding    = false
        internal_dns_name_label = "dc2"
        #subnet_id = "/subscriptions/216a11fd-dfd6-4864-88f7-d930f9219705/resourceGroups/US-HPC-SPOKE01-VNET/providers/Microsoft.Network/virtualNetworks/US-HPC-SPOKE01-VNET/subnets/applayer"
        lz_key                        = "connectivity_spoke2_reg2"
        vnet_key                      = "vnet1"
        subnet_key                    = "frontend"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.100.2.36"
        public_ip_address_key         = "dc_pip1"
        # public_address_id = ""
        # nsg_id = ""
      }
    }

    virtual_machine_settings = {
      windows = {
        name = "dc2"
        #computer_name          = "AE-DUB-DCAZ01"
        size = "Standard_B2ms"

        #admin_username         = "adminuser"
        admin_username_key = "admin-username"
        admin_password_key = "admin-password"

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        identity = {
          type = "SystemAssigned, UserAssigned"
          managed_identity_ids = [
            "/subscriptions/f371e124-4b06-46ea-9d63-f51d48d76e64/resourceGroups/hci01-rg-level1/providers/Microsoft.ManagedIdentity/userAssignedIdentities/hci01-msi-mon"
          ]
        }

        os_disk = {
          name                 = "dc2-osdisk"
          caching              = "ReadWrite"
          storage_account_type = "Premium_LRS"
          os_disk_size_gb      = "127"
          create_option        = "FromImage"
        }

        source_image_reference = {
          publisher = "MicrosoftWindowsServer"
          offer     = "WindowsServer"
          sku       = "2025-Datacenter-g2"
          version   = "latest"
        }

      }
    }
    data_disks = {
      data1 = {
        name                 = "dc2-data1"
        storage_account_type = "Premium_LRS"
        caching              = "None"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "32"
        lun           = 1
        #zones                   = ["1"]
        #disk_encryption_set_key = "set1"
      }
    }
  }
}

# Create a puplic ip address
public_ip_addresses = {
 dc_pip1 = {
   name                    = "dc2"
   resource_group_key      = "rg1"
   sku                     = "Standard"
   allocation_method       = "Static"
   ip_version              = "IPv4"
   idle_timeout_in_minutes = "4"
 }
}
