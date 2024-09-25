# ebs_backup_module/main.tf

resource "aws_dlm_lifecycle_policy" "ebs_backup" {
  description        = var.description
  execution_role_arn = var.execution_role_arn
  state              = var.state

  policy_details {
    resource_types = ["VOLUME"]
    target_tags = {
      Backup = var.backup_tag
    }

    schedule {
      name = var.schedule_name

      create_rule {
        interval      = var.interval
        interval_unit = var.interval_unit
        times         = var.times
      }

      retain_rule {
        count = var.retain_count
      }
    }
  }

  tags = var.tags
}