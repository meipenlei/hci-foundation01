# Virtual machines
virtual_machines = {
  vm1 = {
    resource_group_key = "rg1"
    provision_vm_agent = true
    # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
    # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
    # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage
    boot_diagnostics_storage_account_key = ""
    os_type                              = "linux"

    # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
    keyvault_key = "kv1"

    # shutdown_schedule = {
    #   enabled               = true
    #   daily_recurrence_time = "0100"
    #   timezone              = "Eastern Standard Time"
    #   notification_settings = {
    #     enabled         = true
    #     time_in_minutes = "60"
    #     webhook_url     = "https://sample-webhook-url.example.com"
    #     # email           = ""
    #   }
    # }

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        name                    = "testvm"
        enable_ip_forwarding    = false
        internal_dns_name_label = "testvm"
        #subnet_id = "/subscriptions/**************/resourceGroups/************/providers/Microsoft.Network/virtualNetworks/*********/subnets/*********"
        lz_key                        = "connectivity_spoke3_reg3"
        vnet_key                      = "vnet1"
        subnet_key                    = "frontend"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.100.3.36"
        #public_ip_address_key         = "pip1"
        #public_address_id = ""
      }
    }

    virtual_machine_settings = {
      linux = {
        name = "testvm"
        #computer_name          = "AE-DUB-DCAZ01"
        size = "Standard_B4ms"

        #admin_username         = "adminuser"
        admin_username                  = "adminuser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        identity = {
          type = "SystemAssigned"
        }

        #custom_image_id = "/subscriptions/7fd661f7-3d9e-4c2a-a476-8874ac68d78b/resourceGroups/saf100-rg-images/providers/Microsoft.Compute/images/winImage"

        # create vm by using an self-defined image
        os_disk = {
          name                 = "testvm-osdisk"
          caching              = "ReadWrite"
          storage_account_type = "Premium_LRS"
          os_disk_size_gb      = "127"
          #disk_encryption_set_key = "set1"
        }

        source_image_reference = {
          publisher = "canonical"
          offer     = "0001-com-ubuntu-server-jammy"
          sku       = "22_04-lts"
          version   = "latest"
        }

      }
    }
    data_disks = {
      data1 = {
        name                 = "testvm-data1"
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
# public_ip_addresses = {
#   pip1 = {
#     name                    = "dc1"
#     resource_group_key      = "rg1"
#     sku                     = "Standard"
#     allocation_method       = "Static"
#     ip_version              = "IPv4"
#     idle_timeout_in_minutes = "4"

#   }
# }
