# This are the outputs for the ebs_backup_module

output "dlm_policy_id" {
    description = "ID of the DLM lifecycle policy"
    value       = aws_dlm_lifecycle_policy.ebs_backup.id
}

output "iam_role_arn" {
    description = "ARN of the IAM role"
    value       = aws_iam_role.dlm_role.arn
}