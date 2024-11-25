variable "ami_name" {
    type = string
    default = "ami-012967cc5a8c9f891"
  
}

variable "instance_ty" {
    type = string
    default = "t2.micro"
  
}

variable "key_pair" {
    type=string
    default = "terraform-key"
  
}