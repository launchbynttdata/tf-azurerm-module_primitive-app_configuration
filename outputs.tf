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

output "app_configuration_id" {
  value = azurerm_app_configuration.app_config.id
}

output "app_configuration_name" {
  value = azurerm_app_configuration.app_config.name
}

output "app_configuration_endpoint" {
  value = azurerm_app_configuration.app_config.endpoint
}

output "app_configuration_primary_read_key" {
  value     = azurerm_app_configuration.app_config.primary_read_key
  sensitive = true
}

output "app_configuration_primary_write_key" {
  value     = azurerm_app_configuration.app_config.primary_write_key
  sensitive = true
}

output "app_configuration_secondary_read_key" {
  value     = azurerm_app_configuration.app_config.secondary_read_key
  sensitive = true
}

output "app_configuration_secondary_write_key" {
  value     = azurerm_app_configuration.app_config.secondary_write_key
  sensitive = true
}

output "app_configuration_identity" {
  value = azurerm_app_configuration.app_config.identity
}

output "app_configuration_replica" {
  value = azurerm_app_configuration.app_config.replica
}
