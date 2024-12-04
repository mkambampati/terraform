resource "aws_instance" "tf_ec2" {
    ami="ami-012967cc5a8c9f891"
    dynamic "instances" {
        for_each = var.instances
        content {
            instance_type=instances.value.instance_type
        }
      
    }
  
}