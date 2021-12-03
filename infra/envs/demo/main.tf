terraform {
  backend "s3" {
    bucket = "pdm-terraform"
    region = "us-east-1"
    key    = "tfstate-demo"

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

variable "heroku_api_key" {
  description = "API key for Heroku account associated with email"
}

module "webapp" {
  source         = "../../modules/webapp"
  heroku_api_key = var.heroku_api_key

  heroku_email = "pdm@publicdata.works"
  organization_name    = "pdm"
  team_name    = "pdm"
  app_name     = "police-data-manager-demo"

  env_name = "demo"

  bucket_names = [
    "pdm-demo",
    "gcpd-officers-demo",
    "pdm-complainant-letters-demo",
    "pdm-referral-letters-demo"
  ]

  api_target    = "https://pdm-demo.herokuapp.com"
  public_domain = "https://pdm-demo.herokuapp.com"

  postgres_plan   = "hobby-dev"
  papertrail_plan = "choklad"

  env_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowListingBucketCI",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::pdm-demo"
        },
        {
            "Sid": "AllowBucketContentCRUDCI",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::pdm-demo/*"
        },
        {
            "Sid": "AllowListingBucketOfficers",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::gcpd-officers-demo"
        },
        {
            "Sid": "AllowBucketContentCRUDOfficers",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::gcpd-officers-demo/*"
        },
        {
            "Sid": "AllowListingBucketExports",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::pdm-exports-demo"
        },
        {
            "Sid": "AllowBucketContentCRUDExports",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::pdm-exports-demo/*"
        },
        {
            "Sid": "AllowListingBucketComplainantLetters",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::pdm-complainant-letters-demo"
        },
        {
            "Sid": "AllowBucketContentCRUDComplainantLetters",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::pdm-complainant-letters-demo/*"
        },
        {
            "Sid": "AllowListingBucketReferralLetters",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::pdm-referral-letters-demo"
        },
        {
            "Sid": "AllowBucketContentCRUDReferralLetters",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::pdm-referral-letters-demo/*"
        }
    ]
}
POLICY
  env_policy_groups = [
    "developer",
  "contributor"]

  env_policy_roles = [
    "federated-contributor"
  ]

}
