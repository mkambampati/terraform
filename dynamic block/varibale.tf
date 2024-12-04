variable "instances" {
    default = [
        {instance_type="t2.micro"},
        {instance_type="t3.small"},
        {instance_type="t2.nano"}
    ]
  
}