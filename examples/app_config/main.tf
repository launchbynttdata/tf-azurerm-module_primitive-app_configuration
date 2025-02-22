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

module "resource_names" {
  source  = "terraform.registry.launch.nttdata.com/module_library/resource_name/launch"
  version = "~> 2.0"

  for_each = var.resource_names_map

  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
  region                  = var.location
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  maximum_length          = each.value.max_length
  instance_resource       = var.instance_resource
  use_azure_region_abbr   = var.use_azure_region_abbr
}

module "resource_group" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm"
  version = "~> 1.0"

  name     = module.resource_names["resource_group"].minimal_random_suffix
  location = var.location

  tags = merge(var.tags, { resource_name = module.resource_names["resource_group"].standard })
}

module "app_configuration" {
  source = "../../"

  name                = module.resource_names["app_configuration"].minimal_random_suffix
  resource_group_name = module.resource_group.name
  location            = var.location

  sku = var.sku

  customer_managed_encryption_key = var.customer_managed_encryption_key
  identity_ids                    = var.identity_ids
  local_auth_enabled              = var.local_auth_enabled
  public_network_access           = var.public_network_access
  purge_protection_enabled        = var.purge_protection_enabled
  replicas                        = var.replicas
  soft_delete_retention_days      = var.soft_delete_retention_days

  tags = merge(var.tags, { resource_name = module.resource_names["app_configuration"].standard })

  depends_on = [module.resource_group]
}
