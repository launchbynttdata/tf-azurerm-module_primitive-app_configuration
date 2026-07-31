# tf-azurerm-module_primitive-app_configuration

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

This module is used to deploy Azure App Configuration resources

## Usage

See [examples/app_config](examples/app_config) for a full working example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run the `make configure` command from the root of the repository to ensure that you meet these requirements.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines `pre-commit` hooks for Terraform formatting, validation, documentation generation, and detect-secrets. Hooks are installed when you run `make configure`. Go linting runs via `make lint` in local development and CI, not via pre-commit.

### Terratest examples

Post-deploy tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` target `examples/app_config` via an explicit folder constant in each `main_test.go`. Adding another example requires a new test entry point or updating that constant; it is not picked up automatically.

### Local Validation

You should validate the changes you make to any module locally, prior to pushing your changes in a branch to GitHub.

1. Ensure that you have run `make configure` successfully.
2. Ensure you are signed into Microsoft Azure for the module under test in your current console session and are using an approved non-production subscription.
3. Run the Terraform and Golang linters:

```
make lint
```

4. Once linters pass, run integration tests (apply, test, destroy):

```
make test
```

The pre-commit validations, as well as the `make lint` and `make test` targets, are performed in CI. Running them locally before opening a PR helps ensure a smooth review.

### Review & Merge Process

Open a Pull Request to the default (`main`) branch. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and to drive semantic versioning.

Ensure CI workflows pass, address review feedback, and obtain approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflow files are largely managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to copied skeleton files in this repository unless necessary (for example `.gitignore` entries for generated artifacts). Use `copier check-update` / `copier update` when refreshing from the skeleton.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_configuration.app_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_managed_encryption_key"></a> [customer\_managed\_encryption\_key](#input\_customer\_managed\_encryption\_key) | The customer managed encryption key configuration<br/>    Requires a user assigned identity with read access to the desired key.<br/>    The user assigned identity must be provided in the `identity_ids` variable. | <pre>object({<br/>    key_vault_key_id   = string<br/>    identity_client_id = string<br/>  })</pre> | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned. | `list(string)` | `null` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether local authentication methods is enabled. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the App configuration store. | `string` | n/a | yes |
| <a name="input_public_network_access"></a> [public\_network\_access](#input\_public\_network\_access) | Whether public network access is enabled. Possible values are 'Enabled' and 'Disabled'. | `string` | `"Enabled"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Whether purge protection is enabled. | `bool` | `false` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Locations to replicate the App configuration store | `map(string)` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the App Configuration. Possible values are 'free' and 'standard'. | `string` | `"free"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted. | `number` | `7` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Custom tags for the App Configuration store | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_configuration_endpoint"></a> [app\_configuration\_endpoint](#output\_app\_configuration\_endpoint) | n/a |
| <a name="output_app_configuration_id"></a> [app\_configuration\_id](#output\_app\_configuration\_id) | n/a |
| <a name="output_app_configuration_identity"></a> [app\_configuration\_identity](#output\_app\_configuration\_identity) | n/a |
| <a name="output_app_configuration_name"></a> [app\_configuration\_name](#output\_app\_configuration\_name) | n/a |
| <a name="output_app_configuration_primary_read_key"></a> [app\_configuration\_primary\_read\_key](#output\_app\_configuration\_primary\_read\_key) | n/a |
| <a name="output_app_configuration_primary_write_key"></a> [app\_configuration\_primary\_write\_key](#output\_app\_configuration\_primary\_write\_key) | n/a |
| <a name="output_app_configuration_replica"></a> [app\_configuration\_replica](#output\_app\_configuration\_replica) | n/a |
| <a name="output_app_configuration_secondary_read_key"></a> [app\_configuration\_secondary\_read\_key](#output\_app\_configuration\_secondary\_read\_key) | n/a |
| <a name="output_app_configuration_secondary_write_key"></a> [app\_configuration\_secondary\_write\_key](#output\_app\_configuration\_secondary\_write\_key) | n/a |
<!-- END_TF_DOCS -->
