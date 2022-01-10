resource "aws_iam_user" "awsiamuser" {
  name = "cacingpipebro"
  path = "/system/"

  tags = {
    Name = "Terratest"
  }
}

resource "aws_iam_access_key" "awsiamuser" {
  user = aws_iam_user.awsiamuser.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.awsiamuser.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}