resource "aws_dynamodb_table" "tffile_lock_kmk" {
  name = "tffile_lock_kmk"
  hash_key = "LockID"
  read_capacity = 200
  write_capacity = 200
  attribute {
    name = "LockID"
    type = "S"
  }
}