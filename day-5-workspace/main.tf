resource "aws_s3_bucket" "wp_bucket" {
    bucket = "workspacebucket.kmk"
    tags = {
      Name="Wp_bucket"
    }
  
}