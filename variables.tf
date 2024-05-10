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

variable "train_delay_username" {
  type        = string
  default     = "123"
  description = "Train Delay API Username"
}

variable "train_delay_password" {
  type        = string
  default     = "123"
  description = "Train Delay API Password"
}
