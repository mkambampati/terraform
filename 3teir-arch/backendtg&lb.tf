resource "aws_lb_target_group" "backen_tg"{
    name="backend-tg"
    port=80
    protocol="HTTP"
    vpc_id= aws_vpc.VPC_3_Teir.id
    depends_on=[aws_vpc.VPC_3_Teir]
}

resource "aws_lb" "backend_lb"{
    name="backend-lb"
    internal=false
    load_balancer_type="application"
    security_groups=[aws_security_group.Backend_LB_SG.id]
    subnets=[aws_subnet.pub_1a.id, aws_subnet.pub_2b.id]
    depends_on=[aws_lb_target_group.backen_tg]
    tags={
        Name="backend_lb"
    }
}

resource "aws_lb_listener" "backend_listener"{
    load_balancer_arn=aws_lb.backend_lb.arn
    port="80"
    protocol="HTTP"
    default_action{
        type="forward"
        target_group_arn=aws_lb_target_group.backen_tg.arn
    }
    depends_on=[aws_lb_target_group.backen_tg]
}