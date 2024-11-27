resource "aws_instance" "tf_ec2" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    tags = {
      Name="tf_ec2"
    }

    connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/veerababu/.ssh/id_rsa")
    private_key = file("~/.ssh/id_ed25519")  #private key path
    host        = self.public_ip
  }
  provisioner "local-exec" {
    command = "touch file50"
    
  }

  #provisioner "file" {
   # source = "file10"
    #destination = "/home/ec2-user/file10"
  #}

  provisioner "remote-exec" {
    
    inline = [ "touch file200",
    "echo hello hrithvik>> file200"
    ]
  }
}
