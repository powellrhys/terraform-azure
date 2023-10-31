variable "web_app_name" {
  description = "Name of Web App"
  type        = string
}

variable "location" {
  description = "Web App Location"
  type        = string
}

variable "resource_group_name" {
  description = "Web App Resource Group"
  type        = string
}

variable "service_plan_id" {
  description = "App Service Plan ID"
  type        = string
}

variable "docker_image" {
  description = "Docker Container Image Name and Address"
  type        = string
}

variable "docker_image_tag" {
  description = "Docker Image Tag"
  type        = string
}

variable "app_settings" {
  description = "Web App app settings"
  type        = map(string)
}