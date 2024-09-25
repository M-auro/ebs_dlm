

module "ebs_backup" {
    source = "./ebs_backup_module"

    description        = "EBS backup policy"
    execution_role_arn = aws_iam_role.dlm_role.arn
    state              = "ENABLED"
    backup_tag         = "true"
    schedule_name      = "DailyBackups"
    interval           = 24
    interval_unit      = "HOURS"
    times              = ["00:00"]
    retain_count       = 7
    role_name          = "dlm-role"
}