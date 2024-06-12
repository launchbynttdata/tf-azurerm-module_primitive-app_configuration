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

# COMMON

variable "name" {
  description = "Name of the App configuration store."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

# App configuration store

variable "customer_managed_encryption_key" {
  description = <<EOF
    The customer managed encryption key configuration
    Requires a user assigned identity with read access to the desired key.
    The user assigned identity must be provided in the `identity_ids` variable.
  EOF
  type = object({
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}

variable "local_auth_enabled" {
  description = "Whether local authentication methods is enabled."
  type        = bool
  default     = true
}

variable "public_network_access" {
  description = "Whether public network access is enabled. Possible values are 'Enabled' and 'Disabled'."
  type        = string
  default     = "Enabled"
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled."
  type        = bool
  default     = false
}

variable "replicas" {
  description = "Locations to replicate the App configuration store"
  type        = map(string)
  default     = null
}

variable "sku" {
  description = "The SKU of the App Configuration. Possible values are 'free' and 'standard'."
  type        = string
  default     = "free"
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = number
  default     = 7
}

variable "identity_ids" {
  description = <<EOT
    Specifies a list of user managed identity ids to be assigned.
  EOT
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "Custom tags for the App Configuration store"
  type        = map(string)
  default     = {}
}
