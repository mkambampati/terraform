resource "aws_iam_policy" "s3_policy" {
    name = "s3_policy"
    path = "/"
    policy = jsonencode(
        {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Effect": "Allow",
			"Action": [
				"s3:ListAccessGrants",
				"s3:ListAccessGrantsInstances",
				"s3:ListAccessGrantsLocations"
			],
			"Resource": [
				"*"
			]
		}
	]
}
    )
  
}

