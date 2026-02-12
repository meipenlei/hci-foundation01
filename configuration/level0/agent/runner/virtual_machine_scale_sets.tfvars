
# Virtual machines
virtual_machine_scale_sets = {
  level0 = {
    resource_group = {
      #lz_key = "launchpad"
      key = "rg1"
    }

    boot_diagnostics_storage_account_key = ""
    os_type                              = "linux"

    keyvault_key = "ssh"

    network_interfaces = {
      nic0 = {
        #lz_key                        = "launchpad"
        vnet_key                      = "spoke1"
        subnet_key                    = "frontend"
        name                          = "0"
        primary                       = true
        enable_ip_forwarding          = false
        enable_accelerated_networking = true
        internal_dns_name_label       = "nic0"
      }
    }

    vmss_settings = {
      linux = {
        name                            = "runner-level0"
        computer_name_prefix            = "runnerl0"
        sku                             = "Standard_F2s_v2"
        instances                       = 1
        admin_username                  = "adminuser"
        disable_password_authentication = true
        provision_vm_agent              = true
        overprovision                   = false
        single_placement_group          = false
        upgrade_mode                    = "Automatic"
        source_image_reference = {
          publisher = "canonical"
          offer     = "0001-com-ubuntu-server-jammy"
          sku       = "22_04-lts"
          version   = "latest"
        }

        os_disk = {
          name                 = "release-runner-level0-os"
          caching              = "ReadWrite"
          storage_account_type = "Premium_LRS"
        }

        identity = {
          type = "UserAssigned"

          remote = {
            launchpad = {
              managed_identity_keys = [
                "level0", "level1"
              ]
            }
          }
        }

        custom_data = <<CUSTOM_DATA
#cloud-config
package_upgrade: true
packages:
- docker.io
- ca-certificates
snap:
  commands:
  - snap install powershell --classic
  - snap install kubectl --classic
  - sudo apt  install docker.io -y
runcmd:
- curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
- curl -L "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" -o /usr/bin/jq
- chmod +x /usr/bin/jq
bootcmd:
- mkdir --mode=755 /opt/post-generation
- mkdir -p /etc/systemd/system/walinuxagent.service.d
- echo "[Unit]\nAfter=cloud-final.service" > /etc/systemd/system/walinuxagent.service.d/override.conf
- sed "s/After=multi-user.target//g" /lib/systemd/system/cloud-final.service > /etc/systemd/system/cloud-final.service
- systemctl daemon-reload
CUSTOM_DATA

      }
    }

    virtual_machine_scale_set_extensions = {}

  }
}
