resource "aws_lb_target_group" "frontend_tg"{
    name="frontend-tg"
    port=80
    protocol="HTTP"
    vpc_id= aws_vpc.VPC_3_Teir.id
    depends_on=[aws_vpc.VPC_3_Teir]
}

resource "aws_lb" "frontend_lb"{
    name="frontend-lb"
    internal=false
    load_balancer_type="application"
    security_groups=[aws_security_group.Backend_LB_SG.id]
    subnets=[aws_subnet.pub_1a.id, aws_subnet.pub_2b.id]
    depends_on=[aws_lb_target_group.frontend_tg]
    tags={
        Name="frontend_lb"
    }
}

resource "aws_lb_listener" "frontend_listener"{
    load_balancer_arn=aws_lb.frontend_lb.arn
    port="80"
    protocol="HTTP"
    default_action{
        type="forward"
        target_group_arn=aws_lb_target_group.frontend_tg.arn
    }
    depends_on=[aws_lb_target_group.frontend_tg]
}