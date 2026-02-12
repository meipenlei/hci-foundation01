#
# Execute the following command to get the billing_account_name and management_group_id
#
# az rest --method get --uri https://management.azure.com/providers/Microsoft.Billing/billingaccounts/?api-version=2020-05-01
#
# To retrieve the first billing account
#
# billing_account_name=$(az rest --method get --uri https://management.azure.com/providers/Microsoft.Billing/billingaccounts?api-version=2020-05-01 --query "value[?properties.agreementType=='EnterpriseAgreement'].{name:name}" -o tsv)
#
# enrollment_account_name=$(az rest --method get --uri https://management.azure.com/providers/Microsoft.Billing/billingaccounts?api-version=2020-05-01 --query "value[?properties.agreementType=='EnterpriseAgreement'].{name:properties.enrollmentAccounts[0].name}" -o tsv)
#

subscriptions = {
  identity = {
    name            = "Identity"
    create_alias    = false
    subscription_id = "f371e124-4b06-46ea-9d63-f51d48d76e64"
  }
  connectivity = {
    name            = "Connectivity"
    create_alias    = false
    subscription_id = "f371e124-4b06-46ea-9d63-f51d48d76e64"
  }
  management = {
    name            = "Management"
    create_alias    = false
    subscription_id = "f371e124-4b06-46ea-9d63-f51d48d76e64"
  }
  application001 = {
    name            = "Application Landing Zone 001"
    create_alias    = false
    subscription_id = "f371e124-4b06-46ea-9d63-f51d48d76e64"
  }
}
