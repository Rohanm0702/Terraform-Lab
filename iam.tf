resource "aws_iam_user" "users" {
  count = length(var.iam_users)
  name  = var.iam_users[count.index]
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_group" "project_users" {
  name = "project_users"
}

resource "aws_iam_group" "interns" {
  name = "interns"
}

resource "aws_iam_group" "guests" {
  name = "guests"
}

resource "aws_iam_user_group_membership" "developers_membership" {
  count  = length(var.developer_users)
  user   = var.developer_users[count.index]
  groups = [aws_iam_group.developers.name]
}

resource "aws_iam_user_group_membership" "admins_membership" {
  count  = length(var.admin_users)
  user   = var.admin_users[count.index]
  groups = [aws_iam_group.admins.name]
}

resource "aws_iam_user_group_membership" "project_users_membership" {
  count  = length(var.project_users)
  user   = var.project_users[count.index]
  groups = [aws_iam_group.project_users.name]
}

resource "aws_iam_user_group_membership" "interns_membership" {
  count  = length(var.intern_users)
  user   = var.intern_users[count.index]
  groups = [aws_iam_group.interns.name]
}

resource "aws_iam_user_group_membership" "guests_membership" {
  count  = length(var.guest_users)
  user   = var.guest_users[count.index]
  groups = [aws_iam_group.guests.name]
}

data "aws_iam_policy_document" "developer_policy" {
  statement {
    actions   = ["s3:ListBucket", "s3:GetObject"]
    resources = ["arn:aws:s3:::example_bucket", "arn:aws:s3:::example_bucket/*"]
  }
}

data "aws_iam_policy_document" "admin_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "project_user_policy" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::example_project_bucket", "arn:aws:s3:::example_project_bucket/*"]
  }
}

data "aws_iam_policy_document" "intern_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::example_intern_bucket/*"]
  }
}

data "aws_iam_policy_document" "guest_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::example_guest_bucket/*"]
  }
}

resource "aws_iam_policy" "developer_policy" {
  name        = "developer_policy"
  description = "Policy for developers"
  policy      = data.aws_iam_policy_document.developer_policy.json
}

resource "aws_iam_policy" "admin_policy" {
  name        = "admin_policy"
  description = "Policy for admins"
  policy      = data.aws_iam_policy_document.admin_policy.json
}

resource "aws_iam_policy" "project_user_policy" {
  name        = "project_user_policy"
  description = "Policy for project users"
  policy      = data.aws_iam_policy_document.project_user_policy.json
}

resource "aws_iam_policy" "intern_policy" {
  name        = "intern_policy"
  description = "Policy for interns"
  policy      = data.aws_iam_policy_document.intern_policy.json
}

resource "aws_iam_policy" "guest_policy" {
  name        = "guest_policy"
  description = "Policy for guests"
  policy      = data.aws_iam_policy_document.guest_policy.json
}

resource "aws_iam_group_policy_attachment" "developers_policy_attachment" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.developer_policy.arn
}

resource "aws_iam_group_policy_attachment" "admins_policy_attachment" {
  group      = aws_iam_group.admins.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

resource "aws_iam_group_policy_attachment" "project_users_policy_attachment" {
  group      = aws_iam_group.project_users.name
  policy_arn = aws_iam_policy.project_user_policy.arn
}

resource "aws_iam_group_policy_attachment" "interns_policy_attachment" {
  group      = aws_iam_group.interns.name
  policy_arn = aws_iam_policy.intern_policy.arn
}

resource "aws_iam_group_policy_attachment" "guests_policy_attachment" {
  group      = aws_iam_group.guests.name
  policy_arn = aws_iam_policy.guest_policy.arn
}
