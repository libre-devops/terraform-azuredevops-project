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

