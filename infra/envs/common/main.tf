terraform {
  backend "s3" {
    bucket = "pdm-terraform"
    region = "us-east-1"
    key    = "tfstate-common"

    encrypt                 = true
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "noipm-terraform"
  }
}

provider "aws" {
  version                 = "~> 2.0"
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "noipm-terraform"
}

variable "s3_bucket_names" {
  type    = list
  default = ["pdm-seed-files"]
}

resource "aws_s3_bucket" "seed_files" {
  bucket = "${var.organization_name}-seed-files"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  for_each = toset(var.s3_bucket_names)

  bucket = each.key

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyIncorrectEncryptionHeader",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${each.value}/*",
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption": "AES256"
                }
            }
        },
        {
            "Sid": "DenyUnEncryptedObjectUploads",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${each.value}/*",
            "Condition": {
                "Null": {
                    "s3:x-amz-server-side-encryption": "true"
                }
            }
        },
        {
            "Sid": "DenyUnSecureCommunications",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${each.value}/*",
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "env_policy" {
  name        = "${var.organization_name}-shared-bucket-access"
  description = "A policy to allow bucket listing and CRUD on bucket contents"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowListingBucketSeedFiles",
            "Effect": "Allow",
            "Action": [
              "s3:ListBucket",
              "s3:GetBucketLocation"
             ],
            "Resource": "arn:aws:s3:::${aws_s3_bucket.seed_files.id}"
       },
       {
           "Sid": "AllowBucketContentCRUDSeedFiles",
           "Effect": "Allow",
           "Action": [
               "s3:PutObject",
               "s3:GetObjectAcl",
               "s3:GetObject",
               "s3:DeleteObject",
               "s3:PutObjectAcl"
           ],
           "Resource": "arn:aws:s3:::${aws_s3_bucket.seed_files.id}/*"
       }
    ]
}
POLICY
}

resource "aws_iam_policy_attachment" "attach_policy" {
  name = "shared-policy-group-attachment"
  groups = [
    "developer",
  "production"]
  roles = [
    "federated-contributor",
  ]
  policy_arn = aws_iam_policy.env_policy.arn
}