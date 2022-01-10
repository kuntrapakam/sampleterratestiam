output "awsiamuser" {
    value = "aws_iam_user.awsiamuser.id"
}

output "cloudwatchid" {
    value = "aws_cloudwatch_dashboard.main.id"
}

output "cloudtrail" {
    value ="aws_cloudtrail.ctrail.id"
}

output "awss3bucket" {
    value ="aws_s3_bucket.buckitee.id"
}
