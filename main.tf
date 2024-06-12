// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

resource "azurerm_app_configuration" "app_config" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  local_auth_enabled         = var.local_auth_enabled
  public_network_access      = var.public_network_access
  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  sku = var.sku

  identity {
    type         = var.identity_ids != null ? "SystemAssigned, UserAssigned" : "SystemAssigned"
    identity_ids = var.identity_ids
  }

  dynamic "encryption" {
    for_each = var.customer_managed_encryption_key != null ? [var.customer_managed_encryption_key] : []
    content {
      key_vault_key_identifier = encryption.value.key_vault_key_id
      identity_client_id       = encryption.value.identity_client_id
    }
  }

  dynamic "replica" {
    for_each = var.replicas != null ? var.replicas : {}
    content {
      name     = each.key
      location = each.value
    }
  }

  tags = var.tags
}
