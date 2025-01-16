resource "aws_autoscaling_group" "frontend_asg" {
    name_prefix = "frontend-asg"
    desired_capacity = 1
    max_size = 1
    min_size = 1
    vpc_zone_identifier = [aws_subnet.pvt_3a.id, aws_subnet.pvt_4b.id]
    target_group_arns = [aws_lb_target_group.frontend_tg.arn]
    health_check_type = "EC2"
    launch_template {
      
    }
    instance_refresh {
      strategy = "Rolling"
      preferences {
        min_healthy_percentage = 50
      }
      triggers = ["desired_capacity"]
    }
    tag {
      key="Name"
      value = "frontend-asg"
      propagate_at_launch = true
    }
  
}