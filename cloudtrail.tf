data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "ctrail" {
  name                          = "tf-trail-ctrail"
  s3_bucket_name                = aws_s3_bucket.buckitee.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}

resource "aws_s3_bucket" "buckitee" {
  bucket        = "validationbucketforcloudtrail"
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::validationbucketforcloudtrail"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::validationbucketforcloudtrail/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}