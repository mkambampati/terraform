variable "ingress_rule" {
    default = [
        {
            from_port=80
            to_port=80
            protocal="tcp"
            cidr_block=["0.0.0.0/0"]
        },
        {
            from_port=443
            to_port=443
            protocal="tcp"
            cidr_block=["0.0.0.0/0"]
        },
        {
            from_port=22
            to_port=22
            protocal="tcp"
            cidr_block=["0.0.0.0/0"]
        },
        {
            from_port=8080
            to_port=8080
            protocal="tcp"
            cidr_block=["0.0.0.0/0"]
        }
        

    ]
  
}

variable "egress_rule" {
    default = [
        {
            from_port=0
            to_port=0
            protocal="tcp"
            cidr_block=["0.0.0.0/0"]
        }
    ]
  
}