# ebs_backup_module/outputs.tf

output "dlm_policy_id" {
  description = "ID of the DLM lifecycle policy"
  value       = aws_dlm_lifecycle_policy.ebs_backup.id
}

