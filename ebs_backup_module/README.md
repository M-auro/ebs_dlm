# EBS Backup Module
This module configures an EBS backup policy using AWS Data Lifecycle Manager (DLM).

## Usage

```hcl
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
```

## Inputs

| Name               | Description                              | Type          | Default              | Required |
|--------------------|------------------------------------------|---------------|----------------------|----------|
| description        | Description of the EBS backup policy     | string        | "EBS backup policy"  | no       |
| execution_role_arn | ARN of the IAM role for DLM              | string        | n/a                  | yes      |
| state              | State of the lifecycle policy            | string        | "ENABLED"            | no       |
| backup_tag         | Tag to identify volumes for backup       | string        | "true"               | no       |
| schedule_name      | Name of the backup schedule              | string        | "DailyBackups"       | no       |
| interval           | Interval for creating snapshots          | number        | 24                   | no       |
| interval_unit      | Unit of the interval                     | string        | "HOURS"              | no       |
| times              | Times to create snapshots                | list(string)  | ["00:00"]            | no       |
| retain_count       | Number of snapshots to retain            | number        | 7                    | no       |
| role_name          | Name of the IAM role                     | string        | "dlm-role"           | no       |

## Outputs

| Name           | Description                        |
|----------------|------------------------------------|
| dlm_policy_id  | ID of the DLM lifecycle policy     |


