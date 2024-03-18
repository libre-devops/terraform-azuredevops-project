```hcl
locals {
  date = formatdate("YYYYMM.DD.HHmmss", timestamp())
}

resource "azuredevops_project" "projects" {
  for_each = { for k in var.azdo_projects : k.name => k }

  name               = each.value.name
  description        = each.value.description != null ? each.value.description : "Azure DevOps project created by terraform on ${local.date}"
  visibility         = each.value.visibility
  version_control    = each.value.version_control
  work_item_template = each.value.work_item_template
  features = {
    boards       = each.value.enable_boards == true ? "enabled" : "disabled"
    testplans    = each.value.enable_testplans == true ? "enabled" : "disabled"
    pipelines    = each.value.enable_pipelines == true ? "enabled" : "disabled"
    repositories = each.value.enable_repositories == true ? "enabled" : "disabled"
    artifacts    = each.value.enable_artifacts == true ? "enabled" : "disabled"
  }
}

```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_project.projects](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azdo_projects"></a> [azdo\_projects](#input\_azdo\_projects) | The Azure DevOps projects to configure | <pre>list(object({<br>    name                = string<br>    description         = optional(string)<br>    visibility          = optional(string)<br>    version_control     = optional(string)<br>    work_item_template  = optional(string, "")<br>    enable_boards       = optional(bool, false)<br>    enable_repositories = optional(bool, true)<br>    enable_pipelines    = optional(bool, true)<br>    enable_testplans    = optional(bool, false)<br>    enable_artifacts    = optional(bool, false)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_description"></a> [project\_description](#output\_project\_description) | The project description |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project id |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The project name |
| <a name="output_project_process_template_id"></a> [project\_process\_template\_id](#output\_project\_process\_template\_id) | The process template id |
