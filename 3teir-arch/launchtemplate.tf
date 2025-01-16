data "aws_ami" "frontend_AMI" {
    most_recent = true
    owners = ["self"]
    filter {
      name = "name"
      values = [ "frontend-AMI" ]
    }
  
}

data "aws_ami" "backend_AMI" {
    most_recent = true
    owners = [ "self" ]
    filter {
      name = "name"
      values = [ "Backend-AMI" ]
    }
  
}

