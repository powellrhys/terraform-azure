variable "fpl_league_ids" {
  type        = string
  default     = "123"
  description = "List of league IDs to be displayed in FPL frontend"
}

variable "fpl_manager_id" {
  type        = string
  default     = "123"
  description = "FPL manager ID"
}

variable "fpl_password" {
  type        = string
  default     = "123"
  description = "Frontend Password"
}

variable "fpl_api_key" {
  type        = string
  default     = "123"
  description = "API React Dashboard FPL Key"
}

variable "fpl_dashboard_key" {
  type        = string
  default     = "123"
  description = "React Dashboard FPL Password"
}

variable "storage_account_connection_string" {
  type        = string
  default     = "123"
  description = "Strava client id"
}

variable "strava_app_username" {
  type        = string
  default     = "123"
  description = "Strava app username"
}

variable "strava_app_password" {
  type        = string
  default     = "123"
  description = "Strava app password"
}

variable "strava_account_username" {
  type        = string
  default     = "123"
  description = "Strava account username"
}

variable "strava_account_password" {
  type        = string
  default     = "123"
  description = "Strava account password"
}

variable "github_access_token" {
  type        = string
  default     = "123"
  description = "Github access token"
}
