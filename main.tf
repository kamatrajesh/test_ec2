terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.52.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_user" "iamuser" {
  name = "s3readuser"
}

resource "aws_iam_access_key" "iamuserkey" {
  user = aws_iam_user.iamuser.name
}

resource "aws_iam_user_policy" "iam" {
  name = "test"
  user = aws_iam_user.iamuser.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}
