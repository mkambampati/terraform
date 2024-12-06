resource "aws_iam_policy" "EC2_Policy" {
    name = "EC2_Policy"
    path = "/"
    policy = jsonencode(
        {
    Version = "2012-10-17"
    Statement= [
        {
            "Effect": "Allow"
            "Action": "*"
            "Resource": "*"
        }
    ]
}

    )
  
}

resource "aws_iam_role" "EC2_Role" {
    name = "EC2_Role_Admin"
    assume_role_policy = jsonencode({
        Version ="2012-10-17"
        Statement=[
            {
                Action="sts:AssumeRole"
                Effect="Allow"
                Sid = ""
                Principal={
                    Service = "ec2.amazonaws.com"
                }

            }
        ]
    }
        
    )
  
}

resource "aws_iam_role_policy_attachment" "RP_Attach" {
    role = aws_iam_role.EC2_Role.name
    policy_arn = aws_iam_policy.EC2_Policy.arn
  
}

resource "aws_iam_instance_profile" "EC2_Profile" {
    name="EC2_Profile"
    role = aws_iam_role.EC2_Role.name
  
}