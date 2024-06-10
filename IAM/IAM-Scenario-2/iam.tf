terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.cross_account_id]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "policy" {
  name   = "policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "attachment" {
  name       = "attachment"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}
