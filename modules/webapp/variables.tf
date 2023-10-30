variable "web_app_name" {
  description = "Web App"
  type        = string
}

variable "location" {
  description = "Web App"
  type        = string
}

variable "resource_group_name" {
  description = "Web App"
  type        = string
}

variable "service_plan_id" {
  description = "Web App"
  type        = string
}

variable "docker_image" {
  description = "Web App"
  type        = string
}

variable "docker_image_tag" {
  description = "Web App"
  type        = string
}

variable "app_settings" {
  description = "Web App"
  type        = map(string)
}