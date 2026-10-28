resource "aws_security_group" "jenkins_app_sg" {
  name        = "jenkins-app-sg"
  description = "security group to allow ssh"
  vpc_id      = var.vpc_id
  tags = {
    Name = "jenkins-app-sg"
  }
}


resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  description       = "ssh access to the server"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_sg.id
}

resource "aws_security_group_rule" "egress_ssh" {
  type              = "egress"
  description       = "ssh access to the server"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_sg.id
}


resource "aws_security_group_rule" "ingress_tcp" {
  type              = "ingress"
  description       = "http access to the server"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_sg.id
}



resource "aws_security_group_rule" "ingress_https" {
  type              = "ingress"
  description       = "http access to the server"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_sg.id
}

#Creating Security group for Application  Network Load Balancer
resource "aws_security_group" "jenkins_app_nlb_sg" {
  name        = "jenkins-app-nlb-sg"
  description = "security group to allow http"
  vpc_id      = var.vpc_id
  tags = {
    Name = "jenkins-app-nlb-sg"
  }
}


#Create egress rule for the LB to allow http
resource "aws_security_group_rule" "egress_nlb" {
  type              = "egress"
  description       = "http access to the server"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_nlb_sg.id
}


#Create Ingress rule for the LB to allow http port 8080
resource "aws_security_group_rule" "nlb_ingress_http" {
  type              = "ingress"
  description       = "http access to the server"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_nlb_sg.id
}


#Create Ingress rule for the NLB to allow https port 443
resource "aws_security_group_rule" "nlb_ingress_https" {
  type              = "ingress"
  description       = "https access to the server"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_app_nlb_sg.id
}

