resource "aws_iam_role" "s3_access" {
    assume_role_policy = "arn:aws:iam::637423172345:policy/s3_policy"
    tags = {
      Name="s33"
    }
  
}



# resource "aws_iam_role_policy_attachment" "s3_roles" {
#   role="s3_roles"
#   policy_arn = "arn:aws:iam::637423172345:policy/s3_policy"
# }