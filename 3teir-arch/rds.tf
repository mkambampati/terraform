resource "aws_db_instance" "mysql_rds" {
    db_name = "mysql_rds"
    instance_class = "db.t3.micro"
    allocated_storage = 20
    identifier = "book-rds"
    db_subnet_group_name = aws_db_subnet_group.subnet_rds.id
    engine = "mysql"
    engine_version = "8.0.32"
    multi_az = true
    username = "admin"
    password = "oracle123"
    skip_final_snapshot = true
    publicly_accessible = false
    backup_retention_period = 7
    depends_on = [ aws_db_subnet_group.subnet_rds ]
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    tags = {
      Name="mysql"
    }
  
}

resource "aws_db_subnet_group" "subnet_rds" {
    name = "main"
    subnet_ids = [aws_subnet.pvt_7a.id, aws_subnet.pvt_8b.id]
    depends_on = [ aws_subnet.pvt_7a, aws_subnet.pvt_8b ]
  
}