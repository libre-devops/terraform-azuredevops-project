output "project_description" {
  description = "The project description"
  value = {
    for k, v in azuredevops_project.projects : k => v.description
  }
}

output "project_id" {
  description = "The project id"
  value = {
    for k, v in azuredevops_project.projects : k => v.id
  }
}

output "project_name" {
  description = "The project name"
  value = {
    for k, v in azuredevops_project.projects : k => v.name
  }
}

output "project_process_template_id" {
  description = "The process template id"
  value = {
    for k, v in azuredevops_project.projects : k => v.process_template_id
  }
}
