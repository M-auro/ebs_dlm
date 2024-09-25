# iam_role.tf

# IAM role for Data Lifecycle Manager
resource "aws_iam_role" "dlm_role" {
  name = "dlm-role"

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

# IAM policy for Data Lifecycle Manager
resource "aws_iam_policy" "dlm_policy" {
  name        = "dlm-policy"
  description = "Policy for Data Lifecycle Manager to create and manage snapshots"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeSnapshots",
          "ec2:DescribeVolumes",
          "ec2:DescribeTags"
        ],
        Resource = "*"
      }
    ]
  })
}

# Attach the policy to the IAM role
resource "aws_iam_role_policy_attachment" "dlm_role_attachment" {
  role       = aws_iam_role.dlm_role.name
  policy_arn = aws_iam_policy.dlm_policy.arn
}