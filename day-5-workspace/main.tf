resource "aws_s3_bucket" "wp_bucket" {
    bucket = "workspacebucket.kmk.test"
    tags = {
      Name="Wp_bucket"
    }
  
}