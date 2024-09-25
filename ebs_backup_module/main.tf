# This file contains the terraform code to create the DLM policy and IAM role

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
}

resource "aws_iam_role" "dlm_role" {
    name = var.role_name

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "dlm.amazonaws.com"
                }
            }
        ]
    })
}