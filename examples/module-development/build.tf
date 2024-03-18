module "projects" {
  source = "../../"

  azdo_projects = [
    {
      name       = "Example Project"
      visibility = "private"
    }
  ]
}
