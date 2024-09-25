# variables.tf

variable "description" {
  description = "Description of the EBS backup policy"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the IAM role for DLM"
  type        = string
}

variable "state" {
  description = "State of the lifecycle policy"
  type        = string
  default     = "ENABLED"
}

variable "backup_tag" {
  description = "Tag to identify volumes for backup"
  type        = string
  default     = "true"
}

variable "schedule_name" {
  description = "Name of the backup schedule"
  type        = string
  default     = "DailyBackups"
}

variable "interval" {
  description = "Interval for creating snapshots"
  type        = number
  default     = 24
}

variable "interval_unit" {
  description = "Unit of the interval"
  type        = string
  default     = "HOURS"
}

variable "times" {
  description = "Times to create snapshots"
  type        = list(string)
  default     = ["00:00"]
}

variable "retain_count" {
  description = "Number of snapshots to retain"
  type        = number
  default     = 7
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "dlm-role"
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}