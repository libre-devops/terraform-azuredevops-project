variable "azdo_projects" {
  description = "The Azure DevOps projects to configure"
  type = list(object({
    name                = string
    description         = optional(string)
    visibility          = optional(string)
    version_control     = optional(string)
    work_item_template  = optional(string, "")
    enable_boards       = optional(bool, false)
    enable_repositories = optional(bool, true)
    enable_pipelines    = optional(bool, true)
    enable_testplans    = optional(bool, false)
    enable_artifacts    = optional(bool, false)
  }))
}
