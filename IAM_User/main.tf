module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name = "hrithvik"
  permissions_boundary = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}